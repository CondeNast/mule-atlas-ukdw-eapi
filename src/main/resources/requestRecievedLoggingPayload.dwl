%dw 2.0
output application/json
---
{
	"correlationId": correlationId,
	// Will contain the logging event meta data
	"event":
	{
		"descriptionOfEvent": "Request Received",
		"timeOfLog": now(),
		"logType": "INFO",
		"logFramerworkVersion": "1.0.0",
		"apiName": p('api.name'),
		"tags": p('log.tags')
	},
	// will contain request and response attributes of transaction
	"attributes":
	{
		requestHeaders: (write(vars.requestHeaders)) default null,
		responseHeaders: (write(vars.responseHeaders)) default null,
		responseStatusCode: vars.httpStatus default 200
	},
	//Will contain the request and response payloads
	"data":
	{
		requestPayload: (write(vars.requestPayload)) default null,
		responsePayload: (write(vars.requestPayload)) default null
	},
	//Only to be populated in error handling flows
	"error":
	{
		errorType: null,
		errorCause: null,
		errorDescription: null
	}
}