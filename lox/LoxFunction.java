package lox;

import java.util.List;

class LoxFunction implements LoxCallable {
    private final Stmt.Function declaration;
    private final Environment closure;
    private boolean isInitializer;

    LoxFunction(Stmt.Function declFunction, Environment closure, boolean isInitializer) {
        this.closure = closure;
        this.declaration = declFunction;
        this.isInitializer = isInitializer;
    }

    LoxFunction bind(LoxInstance instance) {
        Environment environment = new Environment(closure);
        environment.define("this", instance);
        return new LoxFunction(declaration, environment, isInitializer);
    }

    @Override
    public Object call(Interpreter interpreter,
                       List<Object> arguments) {
        Environment environment = new Environment(this.closure);
        for (int i = 0; i < this.declaration.params.size(); i++) {
            environment.define(this.declaration.params.get(i).lexeme, arguments.get(i));
        }

        try {
            interpreter.executeBlock(this.declaration.body, environment);
        } catch (Return returnValue) {
            if (isInitializer) return closure.getAt(0, "this");

            return returnValue.value;
        }

        if (isInitializer) return closure.getAt(0, "this");
        return null;
    }

    @Override
    public int arity() {
        return this.declaration.params.size();
    }

    @Override
    public String toString() {
        return "<fn " + declaration.name.lexeme + ">";
    }
}