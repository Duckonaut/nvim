[
    "macro"
] @keyword

(instruction name: (identifier) @function)
(macro name: (identifier) @function.macro)

(register) @variable.builtin
(label_define name: (identifier) @tag)
(label_ref name: (identifier) @tag)
(macro_arg_ref name: (identifier) @function.macro)

(string) @string
(char) @string
(number) @number
(comment) @comment
