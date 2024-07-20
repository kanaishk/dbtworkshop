{% macro create_source_orders() %}
    {% set sql -%}
        create schema if not exists dbtworkshop.TPCH_SF1;
        create TABLE if not exists TPCH_SF1.ORDERS (
            O_ORDERKEY NUMERIC(38,0),
            O_CUSTKEY NUMERIC(38,0),
            O_ORDERSTATUS VARCHAR(1),
            O_TOTALPRICE NUMERIC(12,2),
            O_ORDERDATE DATE,
            O_ORDERPRIORITY VARCHAR(15),
            O_CLERK VARCHAR(15),
            O_SHIPPRIORITY NUMERIC(38,0),
            O_COMMENT VARCHAR(79)
        );
        truncate table TPCH_SF1.orders;
        copy TPCH_SF1.ORDERS(O_ORDERKEY, O_CUSTKEY, O_ORDERSTATUS, O_TOTALPRICE, O_ORDERDATE, O_ORDERPRIORITY, O_CLERK, O_SHIPPRIORITY, O_COMMENT)
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