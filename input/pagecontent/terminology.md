### SKS terminology

The Danish health classification system SKS (Sundhedsvæsenets Klassifikations System) is now
available as FHIR resources, hosted on the Nordic terminology server
([https://tx-nordics.fhir.org/fhir](https://tx-nordics.fhir.org/fhir)), which serves
the SKS CodeSystem and its associated ValueSets. Resources in this guide that need to reference
SKS concepts should bind to and resolve them against the Nordic terminology server.

### ValueSets

{% include list-simple-valuesets.xhtml %}

### CodeSystems

{% for r in site.data.resources -%}
  {%- assign key = r[0] -%}
  {%- assign res = r[1] -%}
  {%- if key contains "CodeSystem/" -%}
    {%- if res.content != "supplement" -%}
<li><a href="{{res.path}}">{{res.title}}</a></li>
    {%- endif -%}
  {%- endif -%}
{%- endfor -%}

### CodeSystem Supplements

{% for r in site.data.resources -%}
  {%- assign key = r[0] -%}
  {%- assign res = r[1] -%}
  {%- if key contains "CodeSystem/" -%}
    {%- if res.content == "supplement" -%}
<li><a href="{{res.path}}">{{res.title}}</a></li>
    {%- endif -%}
  {%- endif -%}
{%- endfor -%}

### ConceptMaps

{% include list-simple-conceptmaps.xhtml %}

### NamingSystems

{% include list-simple-namingsystems.xhtml %}
