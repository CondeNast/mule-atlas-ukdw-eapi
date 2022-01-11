# mule-atlas-ukdw-eapi

Atlas UKDW Experience API consolidates Order FLI Inbound Endpoint and Order BLI Inbound Endpoint.
It accepts PUT requests from UKDW and allows consumers to update FLI's, BLI's on Salesforce Instance.
This api receives the FLI's or BLI's in request payload, updates data in Salesforce Console and returns response.

To deploy the api locally, we need to pass below runtime arguments:

**-Dmule.env=local -Dsecure.key=C0nd3n4s!n0n9106 -Danypoint.platform.gatekeeper=disabled**

The UKDW experience API is used for the following use cases:

**PUT : /billing/billing-line-items**

This API endpoint accepts BLI data containing BLI Id's, status and invokes Brightmedia /billinglineitem endpoint to perform Salesforce Update.
Returns success status after successfully updating BLI's and updates will be visible in Salesforce Console.

**PUT : /fullfilment/fulfillment-line-items**

This API endpoint accepts FLI data containing FLI Id's, status and invokes Brightmedia /fullfilmentlineitem endpoint to perform Salesforce Update.
Returns success status after successfully updating FLI's and updates will be visible in Salesforce Console.

**PUT : /fli-actuals/print (Alias of /billing/billing-line-items)**

**PUT : /billing-line-items (Alias of /fullfilment/fulfillment-line-items)**

**GET : /healthz**

This API endpoint returns health of UKDW Experience API

**GET : /healthz/brightMediaSapi**

This API endpoint returns health of connection between UKDW Experience API and Brightmedia System API
