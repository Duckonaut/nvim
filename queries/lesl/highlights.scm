"if" @keyword
"else" @keyword
"for"  @keyword
(returnStmt) @keyword
(breakStmt) @keyword
(continueStmt) @keyword
(discardStmt) @keyword
"struct" @keyword
"pipeline" @keyword
"function" @keyword

[
    "="
    "+="
    "-="
    "*="
    "/="
    "%="
    "*"
    "/"
    "%"
    "+"
    "-"
    "<"
    ">"
    "<="
    ">="
    "=="
    "!="
    "&&"
    "||"
    "!"
] @operator

(identifier) @variable
(number) @number
(builtin) @constant.builtin
((identifier) @variable.builtin
  (#eq? @variable.builtin "POSITION"))
((identifier) @variable.builtin
  (#eq? @variable.builtin "INSTANCE"))

(functionDecl name: (identifier) @function)
(structDecl name: (identifier) @type)
(pipelineDecl name: (identifier) @module)
(pipelineParameter name: (identifier) @tag)
(parameter name: (identifier) @variable.parameter)
(typeRef name: (identifier) @type)
