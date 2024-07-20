{% macro create_source_lineitem() %}
    {% set sql -%}
        create schema if not exists dbtworkshop.TPCH_SF1;
        create TABLE if not exists TPCH_SF1.LINEITEMS ( L_ORDERKEY NUMERIC(38,0), L_PARTKEY NUMERIC(38,0), L_SUPPKEY NUMERIC(38,0), L_LINENUMBER NUMERIC(38,0), L_QUANTITY NUMERIC(12,2), L_EXTENDEDPRICE NUMERIC(12,2), L_DISCOUNT NUMERIC(12,2), L_TAX NUMERIC(12,2), L_RETURNFLAG VARCHAR(1), L_LINESTATUS VARCHAR(1), L_SHIPDATE DATE, L_COMMITDATE DATE, L_RECEIPTDATE DATE, L_SHIPINSTRUCT VARCHAR(25), L_SHIPMODE VARCHAR(10), L_COMMENT VARCHAR(44) );
        truncate table TPCH_SF1.lineitems;
        copy TPCH_SF1.LINEITEMS(L_ORDERKEY, L_PARTKEY, L_SUPPKEY, L_LINENUMBER, L_QUANTITY, L_EXTENDEDPRICE, L_DISCOUNT, L_TAX, L_RETURNFLAG, L_LINESTATUS, L_SHIPDATE, L_COMMITDATE, L_RECEIPTDATE, L_SHIPINSTRUCT, L_SHIPMODE, L_COMMENT)
        from ''
        iam_role ''
        region 'us-east-1'
        delimiter ','
        ignoreheader 1
        acceptinvchars
        REMOVEQUOTES;
    {%- endset %}
    {% do run_query(sql) %}
{% endmacro %}