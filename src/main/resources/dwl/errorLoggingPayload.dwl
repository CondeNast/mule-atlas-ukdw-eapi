%dw 2.0
output application/json
---
//Logging Framework: Critical Logging 3 Request Completed
{
	"correlationId": correlationId,
	// Will contain the logging event meta data
	"event":
	{
		"descriptionOfEvent": "Request Flow Completed-Custom",
		"timeOfLog": now(),
		"logType": "ERROR",
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
		responsePayload: (write(vars.responsePayload)) default null
	},
	//Only to be populated in error handling flows
	"error":
	{
		errorDescription: error.description default "Unknown Error Occurred",
		errorDetailedDescription: error.detailedDescription default "Unknown Error Occurred",
		errorType: error.errorType default "Error Type Unknown",
		errorCause: error.cause default " Error Cause is Unknown",
		errorMessage: error.errorMessage default "Error Message is not available",
		errorChildErrors: error.childErrors default " Child Errors either do not exist or unknown"
	}
}