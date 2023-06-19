mkdir build
pushd lox

javac Lox.java Environment.java Expr.java Interpreter.java Parser.java RuntimeError.java Scanner.java Stmt.java Token.java TokenType.java LoxCallable.java LoxFunction.java Return.java Resolver.java LoxClass.java LoxInstance.java -d ..\build

popd

pushd build

java lox.Lox ..\loxCode\class.lox

popd