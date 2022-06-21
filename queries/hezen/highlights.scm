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

(call callee: (primary (identifier) @function))
(function name: (identifier) @function)
(function params: (parameters (identifier) @variable.parameter))

(string) @string
(number) @number
(builtin) @constant.builtin
