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
    "match"
    "on"
    "is"
    "as"
] @keyword

(visibility) @keyword

[
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
(functionParameters (functionParameter (typedIdentifier name: (identifier)) @variable.parameter))
(functionParameters (functionParameter precondition: (namespacedIdentifier name: (identifier) @type)))
(functionParameters precondition: (namespacedIdentifier name: (identifier) @type))

(typedIdentifier name: (identifier) @variable)
(typePrimary (namespacedIdentifier name: (identifier) @type))
(typeDeclaration name: (identifier) @type)

(variantDeclaration name: (identifier) @type)
(variantDeclaration self: ("self") @type.builtin)

(traitDeclaration name: (identifier) @type)

(module name: (identifier) @module)

(traitImplementation implementor: (identifier) @type)
(traitImplementation implementee: (namespacedIdentifier name: (identifier) @type))

(call (expression (primary (constructor (namespacedIdentifier name: (identifier) @function)))))
(call (expression (primary (fieldAccess field: (identifier) @function))))
(coalesceAccess type: (type (typePrimary (namespacedIdentifier name: (identifier) @type))))
(fieldConstructor name: (identifier) @variable.parameter)
(constructor (namespacedIdentifier name: (identifier) @type) . "{")

(string) @string
(char) @string
(number) @number
(builtin) @constant.builtin
(builtinType) @type.builtin

(comment) @comment
