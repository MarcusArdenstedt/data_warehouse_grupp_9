{% docs __overview__%}

# HR Analytics

This project is a proof of concept of a HR Analytics product inteded to help Talent acquisition specialists to be on top of latest job ads from Swedish "Arbetsförmedlingen" without minimal manual work.

As can be seen in lineage graph, data source is job_ad API from Arbetsförmedlingen. It is then modelled in a star schema in the data warehouse. The last mart layer is then serving the final dashboards. Sources are updated via DLT.

## Star schema
![Star schema](assets/star_schema.png)

{% enddocs %}
