# mule-atlas-ukdw-eapi

## About Application
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

## Particular Consideration for this Application
1. Added mule-atlas-log4j-elastic-appender as a dependency to log application logs on ELK and disabled cloudhub logs.
2. Added log4j2.formatMsgNoLookups property as true to overcome with the log4j vulnerability.
3. Included secure (encrypted) properties with encryption algorithm - AES and mode - CBC.

## Known Errors During Exection
NA

## Debugging Application in Cloudhub

### Logging
There are two types of logging that can be activated in cloudhub:

First is Debug Logs Provided by Developers in the Application 
org.mule.runtime.core.api.processor.LoggerMessageProcessor DEBUG for logger only

Second is Full Debug Logs implicit of Mule Internal Logs
org.mule DEBUG

By providing respective values in logging settings of Runtime Manager respective Debug Logs can be activated on cloudhub

## Contributing
Please follow branching strategy and deployment strategy as mentioned on Condenast Confluence.
