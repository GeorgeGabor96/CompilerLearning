pushd lox

javac Environment.java Expr.java Interpreter.java Lox.java Parser.java RuntimeError.java Scanner.java Stmt.java Token.java TokenType.java

popd

java lox.Lox loxCode\ex.lox