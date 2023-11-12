
A `Value` class used to represent the three possible states:
- absence of a value
- presence of a value that is `null`
- presence of a non-null value

This class is used by the generated code for GraphQL variables and input types that are nullable
in order to distinguish between the absence of a value and the presence of a `null` value, typically
used for "update" Mutations.
