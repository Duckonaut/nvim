 [
    "print" 
    "if" 
    "for" 
    "while" 
    "var" 
    "mut"
    "break"
    "continue"
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
    "and"
    "or"
    "!"
] @operator

(string) @string
(identifier) @identifier
(number) @number
(builtin) @constant.builtin
