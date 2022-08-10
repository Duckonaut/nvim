[
    "if" 
    "else"
    "for" 
    "while" 
    "var" 
    "mut"
    "return"
    "break"
    "continue"
    "fn"
    "class"
] @keyword

[
    "="
    "*"
    "/"
    "+"
    "-"
    "<"
    ">"
    "<="
    ">="
    "=="
    "!="
    "and"
    "or"
    "!"
] @operator

(identifier) @variable

(primaryCall callee: (primary (identifier) @function))
(function name: (identifier) @function)
(function params: (parameters (identifier) @variable.parameter))

(classDecl className: (identifier) @type)
(classDecl classSuper: (identifier) @type)
(classDecl classMethods: (function name: (identifier) @function.method))


(string) @string
(number) @number
(builtin) @constant.builtin
(super) @constant.builtin
