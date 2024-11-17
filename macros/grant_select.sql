{%macro grant_select(schema=target.schema,role=target.role)%}

    {% set query %}
        grant usage on schema {{schema}} to role {{role}};
        grant select  on all tables in schema {{schema}} to role {{role}};
        grant select  on all views in schema {{schema}} to role {{role}};
    {%endset%}
    {{ log('granting select and usage in schema' ~schema ~ 'and role' ~role, info=True)}}
    {% do run_query(query) %}

    {{log('success',info=True)}}
{%endmacro%}