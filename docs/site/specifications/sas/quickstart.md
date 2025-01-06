A dataset is a structured collection of data. Each entry within the dataset adheres to the same structure, which is referred to as its **data model**. The data model defines how data within each entry are arranged and related. 

A schema is a formal and machine readable definition of a data model. 

To facilitate re-use, keywords can be organized into vocabularies. A vocabulary consists of a list of keywords, together with their syntax and semantics. A dialect is defined as a set of vocabularies and their required support identified in a meta-schema

## JSON Schema

JSON Schema is a declarative language for annotating and validating JSON documents' structure, constraints, and data types. It provides a way to standardize and define expectations for JSON data.

Media Type: "application/schema+json"

Home page: [https://json-schema.org/](https://json-schema.org/)

Spec: [https://json-schema.org/draft/2020-12/json-schema-core](https://json-schema.org/draft/2020-12/json-schema-core)

Annotation: from spec... *"Unrecognized individual keywords simply have their values collected as annotations, while the behavior with respect to an unrecognized vocabulary can be controlled when declaring which vocabularies are in use."* and again ... *"A JSON Schema MAY contain properties which are not schema keywords. Unknown keywords SHOULD be treated as annotations, where the value of the keyword is the value of the annotation."*

https://json-schema.org/draft/2020-12/json-schema-core#name-annotations

```json
{
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "title": "transportOrder",
    "type": "object",


    "sasDialects": {
      "https://dpds.opendatamesh.org/specifications/sas/1.0.0/#datastore": {"prefix":"dpds", "required":false},
      "https://dpds.opendatamesh.org/specifications/sas/1.0.0/#semantics": {"prefix":"dpds", "required":false},
      "https://bitol-io.github.io/open-data-contract-standard/v3.0.0/#quality": {"prefix":"bitol","required":false}
    },

    "dpds.physicalType": "TABLE",
    "dpds.physicalName": "TRANSPORT_ORDER",
    "dpds.context": {
        "base": "https://schema.org",
        "type": "[Movie]",
        "mappings": {
            "movieId": null,
            "directorName": "director[Person].name",
            "directorCountryName": "director[Person].country[Country].name",
            "actors": "actor[Person].name",
            "copyright": {
                "type": "copyrightHolder[Organization]",
                "mappings": {
                    "organizationId": null,
                    "email": "contactPoint[ContactPoint].mail"
                }
            }  
        }
    },

    "properties": {
      "orderId": {
        "type": "integer",
        "description": "Primary key, auto-incrementing order ID",

        "dpds.physicalType": "INT",
        "dpds.physicalName": "ORDER_ID"
      },
      "customerName": {
        "type": "string",
        "maxLength": 255,
        "description": "Name of the customer placing the order",

        "dpds.physicalType": "VARCHAR(255)",
        "dpds.physicalName": "CUSTOMER_NAME",
        "bitol.quality": {
            "type": "library",
            "rule": "notNull",
            "mustBeEqaul": 0,
            "unit": "rows"
        }
      }
    },
    "required": ["orderId", "customerName"]
}
```

## YAML Schema

Spec:

Annotation: 

## AVRO Schema

Spec:

Annotation: 

## PROTOBUF Schema

Spec:

Annotation: 