# XXX Specification

#### Version 1.0.0 (DRAFT)
The keywords "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in <a href="https://tools.ietf.org/html/bcp14" target="_blank">BCP 14:octicons-link-external-24:</a> <a href="https://tools.ietf.org/html/rfc2119" target="_blank">RFC2119:octicons-link-external-24:</a> <a href="https://tools.ietf.org/html/rfc8174" target="_blank">RFC8174:octicons-link-external-24:</a> when, and only when, they appear in all capitals, as shown here.

This document is licensed under <a href="https://www.apache.org/licenses/LICENSE-2.0.html" target="_blank">The Apache License, Version 2.0:octicons-link-external-24:</a>.

#### Disclaimer

TODO

## Introduction

The XXX Specification (XXXS) offers a declarative, technology-independent standard for...

Defining XXX through an open specification is useful to:

- AAA
- BBB
- CCC

## Table of Contents

<!-- TOC depthFrom:1 depthTo:3 withLinks:1 updateOnSave:1 orderedList:0 -->
- [Definitions](#definitions)
	- [Standard](#standard)
	- [Standard Specification](#standard-specification)
	- [Standard Definition](#standard-definition)
	- [XXX](#xxx)
	- [AAA](#AAA)
	- [BBB](#BBB)
	- [CCC](#CCC)
	- [Data Product Descriptor Document](#xxx-document)
	- [Data Product Descriptor Specification](#xxx-specification)
- [Specification](#specification)
	- [Versions](#versions)
	- [Format](#format)
	- [Document Structure](#document-structure)
	- [Data Types](#datastypes)
	- [Rich Text Formatting](#rich-text-formatting)
	- [Relative References In URLs](#relative-references-in-urls)
	- [Schema](#schema)
		- [Data Product Descriptor Entity](#data-product-descriptor-entity)
		- [Info Object](#info-object)
		- [Owner Object](#owner-object)
		- [Reference Object](#reference-object)
		- [External Resource Object](#external-resource-object)	
		- [Standard Definition Component](#standard-definition-component)
	- [Specification Extensions](#specification-extensions)
- [Appendix A: Revision History](#revision-history)


<!-- /TOC -->


## <a name="definitions"></a>Definitions

##### <a name="definitionsStandard"></a>Standard
The set of shared rules used by different agents to describe an entity or process of common interest. By conforming to these rules, agents limit their autonomy to enable interoperability, allowing for smoother cooperation.

##### <a name="definitionsSpecification"></a>Standard Specification
The formal description of the rules that form a [standard](#definitionsStandard). A standard can have multiple specification versions associated with it. Sometimes the words standard and specification are used as synonymous. 

##### <a name="definitionsDefinition"></a>Standard Definition
The description of one specific entity or process created using and conforming to the set of rules formally described in the [standard specification](#definitionsSpecification)

##### <a name="definitionsXXX"></a>XXX
TODO

##### <a name="definitionsAAA"></a>AAA
TODO

##### <a name="definitionsBBB"></a>BBB
TODO

##### <a name="definitionsCCC"></a>CCC
TODO

##### <a name="definitionsXXXDocument"></a>XXX Document
The document (or set of documents) that contains the standard definition of a [xxx](#definitionsXXX) created using and conforming to the [XXX Specification](definitionsXXXSpecification).

##### <a name="definitionsXXXSpecification"></a>XXX Specification
The formal description of the rules to follow to create a standard-compliant [XXX Document](definitionsXXXDocument).


## <a name="specification"></a>Specification

### <a name="versions"></a> Versions

The XXX Specification is versioned using <a href="https://semver.org/spec/v2.0.0.html)" target="_blank">Semantic Versioning 2.0.0:octicons-link-external-24:</a> (semver) and follows the semver specification.

The `major`.`minor` portion of the semver (for example `1.0`) SHALL designate the DPDS feature set. Typically, *`.patch`* versions address errors in this document, not the feature set. Tooling which supports XXXS 1.0 SHOULD be compatible with all XXXS 1.0.\* versions. The patch version SHOULD NOT be considered by tooling, making any distinction between `1.0.0` and `1.0.1` for example.

Each new minor version of the XXX Specification SHALL allow any XXX document that is valid against any previous minor version of the Specification, within the same major version, to be updated to the new Specification version with equivalent semantics. Such an update MUST only require changing the `xxx` property to the new minor version.

For example, a valid XXX 1.0.2 document, upon changing its `xxx` property to `1.1.0`, SHALL be a valid XXX 1.1.0 document, semantically equivalent to the original XXX Descriptor 1.0.2 document. New minor versions of the XXX Specification MUST be written to ensure this form of backward compatibility.


### <a name="format"></a> Format

A [Data Product Descriptor Document](#definitionsDpdsDocument) that conforms to the [Data Product Descriptor Specification](#definitionsDpdsSpecification) is itself a JSON object, which may be represented either in JSON or YAML format.

For example, if a field has an array value, the JSON array representation will be used:

```json
{
   "field": [ 1, 2, 3 ]
}
```
All field names in the specification are **case-sensitive**.
This includes all fields that are used as keys in a map, except where explicitly noted that keys are **case-insensitive**.

The schema exposes two types of fields: Fixed fields, which have a declared name, and Patterned fields, which declare a regex pattern for the field name.

Patterned fields MUST have unique names within the containing object. To preserve the ability to round-trip between YAML and JSON formats, YAML version <a href="https://yaml.org/spec/1.2/spec.html" target="_blank">1.2:octicons-link-external-24:</a> is RECOMMENDED along with some additional constraints:

- Tags MUST be limited to those allowed by the <a href="https://yaml.org/spec/1.2/spec.html#id2803231" target="_blank">JSON Schema ruleset:octicons-link-external-24:</a>.
- Keys used in YAML maps MUST be limited to a scalar string, as defined by the <a href="https://yaml.org/spec/1.2/spec.html#id2802346" target="_blank">YAML Failsafe schema ruleset:octicons-link-external-24:</a>.


### <a name="documentStructure"></a>Document Structure

A [XXX Document](#definitionsXXXDocument) MAY be made up of a single document or be divided into multiple, connected parts at the discretion of the user. In the latter case, a [`Reference Object`](#reference-object) is used.

It is RECOMMENDED that the root [XXX Document](#definitionsDpdsDocument) be named: `xxx.json` or `xxx.yaml`.

### <a name="objectTypes"></a>Object Types

A [XXX Document](#definitionsXXXDocument) has one and only one root object. The properties of an object are described by its fields. A field type can be another object or a [primitive type](#dataTypeFormat). An addressable and versioned object is called entity. The root object of the [XXX Document](#definitionsXXXDocument) is an entity object. Other entities that exist only in the scope of the root entity are called components. 

### <a name="dataTypes"></a>Data Types

Primitive data types in the DPDS are based on the types supported by the <a href="https://json-schema.org/draft/2020-12/json-schema-core.html#name-instance" target="_blank">JSON Schema Specification:octicons-link-external-24:</a>. 


<a name="dataTypeFormat"></a>Primitives have an optional modifier property: `format`.
DPDS uses several known formats to define in fine detail the data type being used.
However, to support documentation needs, the `format` property is an open `string`-valued property and can have any value.
Formats such as `"email"`, `"uuid"`, and so on, MAY be used even though undefined by this specification.
Types that are not accompanied by a `format` property follow the type definition in the JSON Schema. Tools that do not recognize a specific `format` MAY default back to the `type` alone as if the `format` is not specified.

The formats defined by the DPDS are:

[`type`](#dataTypes) | [`format`](#dataTypeFormat) | Comments
------ | -------- | --------
`integer` | `int32` | signed 32 bits
`integer` | `int64` | signed 64 bits (a.k.a long)
`number` | `float` | |
`number` | `double` | |
`string` | | |
`string` | `alphanumeric` | a string that match the following regex `^[a-zA-Z0-9]+$`
`string` | `name` | a string that match the following regex `^[a-zA-Z][a-zA-Z0-9]+$`
`string` | `fqn` | a string that match the following regex `^[a-zA-Z][a-zA-Z0-9.:]+$`
`string` | `version` | a string that match the following regex `^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$`
`string` | `byte` | base64 encoded characters
`string` | `binary` | any sequence of octets
`string` | `uuid` | a sequence of 16 octets as defined by <a href="https://www.rfc-editor.org/rfc/rfc4122.html" target="_blank">RFC4122:octicons-link-external-24:</a>
`boolean` | | |
`string` | `date` | As defined by `full-date` - <a href="https://www.rfc-editor.org/rfc/rfc3339" target="_blank">RFC3339:octicons-link-external-24:</a>
`string` | `date-time` | As defined by `date-time` - <a href="https://www.rfc-editor.org/rfc/rfc3339" target="_blank">RFC3339:octicons-link-external-24:</a>
`string` | `password` | A hint to UIs to obscure input.


### <a name="richText"></a>Rich Text Formatting
Throughout the specification `description` fields are noted as supporting CommonMark markdown formatting.
Where Data Product Descriptor tooling renders rich text it MUST support, at a minimum, markdown syntax as described by <a href="https://spec.commonmark.org/0.27/" target="_blank">CommonMark 0.27:octicons-link-external-24:</a>. Tooling MAY choose to ignore some CommonMark features to address security concerns. 

### <a name="relativeReferences"></a>Relative References in URLs

Unless specified otherwise, all properties that are URLs SHOULD be absolute references. If a property explicitly specifies in its description that allows a relative reference its value MUST be compliant with <a href="https://tools.ietf.org/html/rfc3986#section-4.2" target="_blank">RFC3986:octicons-link-external-24:</a>. Relative references MUST be resolved using the URLs defined in the property description as a Base URI.

Relative references used in `$ref` are processed as per <a href="https://tools.ietf.org/html/draft-pbryan-zyp-json-ref-03" target="_blank">JSON Reference:octicons-link-external-24:</a>, using the URL of the current document as the base URI. See also the [Reference Object](#reference-object).


### <a name="schema"></a>Schema

In the following description, if a field is not explicitly **REQUIRED** or described with a MUST or SHALL, it can be considered OPTIONAL.


#### <a name="xxxObject"></a>Data Product Descriptor Entity

This is the root object of the [Data Product Descriptor Document](#definitionsDpdsDocument).


##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="dpdsSpecVersion"></a>dataProductDescriptor | `string:version` | **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the [Data Product Descriptor Specification Version](#versions) that the [Data Product Descriptor Document](#definitionsDpdsDocument) uses. The [`dataProductDescriptor`](#dpdsSpecVersion) field SHOULD be used by tooling specifications and clients to interpret the [Data Product Descriptor Document](#definitionsDpdsDocument). This is *not* related to the data product's [`info.version`](#infoVersion) field.
<a name="dpdsInfoObject"></a>info | [Info Object](#infoObject) | **(REQUIRED)** The general information about the data product. The information can be used by the platform or by consumers if needed.
<a name="dpdsInterfaceComponents"></a>interfaceComponents | [Interface Components Object](#interfaceComponentsObject) | **(REQUIRED)** The list of all interface entities exposed by the data product.
<a name="dpdsInternalComponents"></a>internalComponents | [Internal Components Object](#internalComponentsObject) | The list of all internal entities that compose the data product.
<a name="dpdsComponents"></a>components | [Components Object](#componentsObject) | An element to hold a set of reusable objects that can be referentiated in other part of the document.
<a name="dpdsTags"></a>tags | [`string`] | A list of tags associated to the data product. Tags can be used for logical grouping of data products.
<a name="dpdsExternalDocumentation"></a>externalDocs | [External Resource Object](#externalResourceObject) | Additional external documentation.

This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="infoObject"></a>Info Object

The `Info Object` contains general information about the data product. The information can be used by the platform or by consumers if needed.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="infoId"></a>id | `string:uuid` | **(READONLY)** It's an UUID version 3 ([RFC-4122](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.3)) generated server side during data product creation as SHA-1 hash of the [`fullyQualifiedName`](#dpdsFullyQualifiedName). It MAY be used  when calling the API exposed by the data product experience plane to referentiate the data product. Because the [`fullyQualifiedName`](#dpdsFullyQualifiedName) is globally unique also the `id` is globally unique, anyway to referentiate the data product when calling an API different from the ones exposed by the data product experience plane the [`fullyQualifiedName`](#dpdsFullyQualifiedName) MUST be always used. Example: `"id: "2b172838-73b1-5d6c-be45-cc75aee180a0"`
<a name="infoFullyQualifiedName"></a>fullyQualifiedName | `string:fqn` | **(READONLY)** The unique universal idetifier of the data product. It MUST be a URN of the form `urn:dpds:{mesh-namespace}:dataproducts:{product-name}:{product-major-version}`.  It's RECOMMENDED to use as `mesh-namespace` your company's domain name in reverse dot notation (es `it.quantyca`) in order to ensure that the `fullyQualifiedName` is unique universal idetifier as REQUIRED. To the `mesh-nemaspace` MAY be added as postfix the product's 'domain' (es. `planning`, `operations`, ...). Using the data product's `domain` as postfix in the `mesh-namespace` is anyway NOT RECOMMENDED. Example: `"fullyQualifiedName: "urn:dpds:it.quantyca:dataproducts:tripExecution:1"`.
<a name="infoEntityType"></a>entityType | `string:alphanumeric` | **(READONLY)** The type of the entity. It MUST be a constant value equals to `dataproduct`.
<a name="infoName"></a>name | `string:name` | **(REQUIRED)** The name of the data product. MUST be unique within the `mesh-namespace`. It's RECOMMENDED to use a camel case formatted string.
<a name="infoVersion"></a>version | `string:version` | **(REQUIRED)** The [semantic version number](https://semver.org/spec/v2.0.0.html) of the data product definition contained in the given [Data Product Descriptor Document](#definitionsDpdsDocument). Everytime the *major version* of one of the data product's ports changes also the *major version* of the product MUST be incremented. It is RECOMMENDED to use 0 as *major version* for data products that are not yet general available. These data products can introduce breaking changes without incrementing their *major version*. It is anyway RECOMMENDED that for every breaking change introduced by a data product that is not yet general available (i.e. *major version* equals to 0) at least the *minor version* is incremented. This field is *not* related to the [`dataProductDescriptor`](#dpdsSpecVersion) field.
<a name="infoDisplayName"></a>displayName | `string` | The human readable name of the data product. It SHOULD be used by frontend tool to visualize data product's name in place of the [`name`](#dpdsName) property. It's RECOMMENDED to not use the same `displayName` for different data products belonging to the same `mesh-namespace`.
<a name="infoDescription"></a>description | `string` | The data product description. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation.
<a name="infoDomain"></a>domain | `string:name` | **(REQUIRED)** The domain to which the data product belongs to.
<a name="infoOwner"></a>owner | [Owner Object](#ownerObject) | **(REQUIRED)** A collection of information related to the data product's owner.
<a name="infoContactPoints"></a>contactPoints | \[[Contact Point Object](#contactPointObject)\] | A collection of contact information for the given data product.

This object MAY be extended with [Specification Extensions](#specificationExtensions).


#### <a name="ownerObject"></a>Owner Object

The `Owner Object` describes the data product's owner.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="infoOwnerId"></a>id| `string` | **(REQUIRED)** The identifier of the data product's owner. It's RECOMMENDED to use the corporate mail of the owner as identifier.
<a name="infoOwnerName"></a>name | `string` | The full name of the data product's owner

This object MAY be extended with [Specification Extensions](#specificationExtensions).

##### Owner Object Example:

```json
{
  "id": "john.doe@company-xyz.com",
  "name": "John Doe"
}
``` 




#### <a name="referenceObject"></a>Reference Object

The `Reference Object` allows referencing other components in the [Data Product Descriptor Document](#definitionsDpdsDocument), internally and externally.

The `$ref` string value contains a URI [RFC3986](https://tools.ietf.org/html/rfc3986), which identifies the location of the value being referenced.

See the rules for resolving [Relative References](#relativeReferencesURI).

##### Fixed Fields
Field Name | Type | Description
---|:---:|---
<a name="referenceDescription"></a>description | `string` | A description which by default SHOULD override that of the referenced component. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation. If the referenced object-type does not allow a `description` field, then this field has no effect.
<a name="referenceMediaType"></a>mediaType | `string` | The media type of the referenced resource. It must conform to media type format, according to [RFC6838](https://www.rfc-editor.org/rfc/rfc6838).
<a name="referenceRef"></a>$ref | `string:uri-reference` | **REQUIRED**. The reference identifier. This MUST be in the form of a URI.

This object cannot be extended with additional properties and any properties added SHALL be ignored.

##### Reference Object Example

```json
{
  "$ref": "#/components/schemas/Pet"
}
```

##### Relative Schema Document Example
```json
{
  "$ref": "Pet.json"
}
```

##### Relative Documents With Embedded Schema Example
```json
{
  "$ref": "definitions.json#/Pet"
}
```

#### <a name="referenceObject"></a>Reference Object

The `Reference Object` allows referencing other components in the [Data Product Descriptor Document](#data-product-descriptor-document), internally and externally.

The `$ref` string value contains a URI [RFC3986](https://tools.ietf.org/html/rfc3986), which identifies the location of the value being referenced.

See the rules for resolving [Relative References](#relativeReferencesURI).

##### Fixed Fields
Field Name | Type | Description
---|:---:|---
<a name="referenceDescription"></a>description | `string` | A description which by default SHOULD override that of the referenced component. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation. If the referenced object type does not allow a `description` field, then this field has no effect.
<a name="referenceMediaType"></a>mediaType | `string` | The media type of the referenced resource. It must conform to media type format, according to [RFC6838](https://www.rfc-editor.org/rfc/rfc6838).
<a name="referenceRef"></a>$ref | `string:uri-reference` | **REQUIRED**. The reference identifier. This MUST be in the form of a URI.

This object cannot be extended with additional properties and any properties added SHALL be ignored.

##### Reference Object Example

```json
{
  "$ref": "#/components/schemas/Pet"
}
```

##### Relative Schema Document Example
```json
{
  "$ref": "Pet.json"
}
```

##### Relative Documents With Embedded Schema Example
```json
{
  "$ref": "definitions.json#/Pet"
}
```

#### <a name="externalResourceObject"></a>External Resource Object

The `External Resource Object` allows referencing an external resource like a documentation page.

##### Fixed Fields

Field Name | Type | Description
---|:---:|---
<a name="externalResourceDescription"></a>description | `string` | A description of the target resource. [CommonMark syntax](https://spec.commonmark.org/) MAY be used for rich text representation. 
<a name="externalResourceMediaType"></a>mediaType | `string` | The media type of target resource. It must conform to media type format, according to [RFC6838](https://www.rfc-editor.org/rfc/rfc6838).
<a name="externalResourceHref"></a>$href | `string:uri` | **REQUIRED**. The URI of the target resource. It must conform to the URI format, according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986).

This object cannot be extended with additional properties and any properties added SHALL be ignored.

##### External Resource Object Example

```json
{
  "description": "Find more info here",
  "mediaType": "text/html",
  "$href": "https://example.com"
}
```

### <a name="specificationExtensions"></a>Specification Extensions

While the [Data Product Descriptor Specification](#data-product-descriptor-specification) tries to accommodate most use cases, additional data can be added to extend the specification at certain points.
The extension properties are implemented as patterned fields that are always prefixed by `"x-"`.

Field Pattern | Type | Description
---|:---:|---
<a name="infoExtensions"></a>^x- | Any | Allows extensions to the Data Product Descriptor Schema. The field name MUST begin with `x-`, for example, `x-internal-id`. The value can be `null`, a primitive, an array, or an object. It can have any valid JSON format value.

The extensions may or may not be supported by the available tooling, but those may be extended as well to add requested support (if tools are internal or open-sourced).

## <a name="revisionHistory"></a>Appendix A: Revision History

Version   | Date       | Notes
---       | ---        | ---
1.0.0     | 2024-JUNE	   | Release of the XXX Specification 1.0.0-DRAFT 
1.0.0-DRAFT     | 2023-JANUARY	   | Release of the XXX Specification 1.0.0-DRAFT 
