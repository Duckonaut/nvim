[
    "mod"
    "fn"
    "type"
    "trait"
    "impl"
    "for"
    "in"
    "if"
    "else"
    "break"
    "continue"
    "return"
    "while"
    "var"
] @keyword

(visibility) @keyword

[
    "@"
    "@="
    "!@="
    "->"
    "|"
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

[
    "::"
    "."
    ","
    ";"
    ":"
] @punctuation.delimiter

[
    "("
    ")"
    "{"
    "}"
    "["
    "]"
] @punctuation.bracket

(functionSignature name: (identifier) @function)
(functionParameters (typedIdentifier name: (identifier)) @variable.parameter)

(typedIdentifier name: (identifier) @variable)
(typePrimary name: (identifier) @type)
(typeDeclaration name: (identifier) @type)

(variantDeclaration name: (identifier) @type)
(variantDeclaration self: ("self") @type.builtin)

(traitDeclaration name: (identifier) @type)

(module name: (identifier) @module)

(traitImplementation implementor: (identifier) @type)
(traitImplementation implementee: (identifier) @type)

(access module: (identifier) @module)
(access name: (identifier) @property)
(call (expression (access name: (identifier) @function)))

(string) @string
(number) @number
(builtin) @constant.builtin
(builtinType) @type.builtin

(comment) @comment
