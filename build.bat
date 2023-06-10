mkdir build
pushd lox

javac Lox.java Environment.java Expr.java Interpreter.java Parser.java RuntimeError.java Scanner.java Stmt.java Token.java TokenType.java LoxCallable.java LoxFunction.java Return.java -d ..\build

popd

pushd build

java lox.Lox ..\loxCode\ex.lox

popd