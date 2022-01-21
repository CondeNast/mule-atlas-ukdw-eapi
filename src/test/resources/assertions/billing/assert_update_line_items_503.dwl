%dw 2.0
import * from dw::test::Asserts
---
payload  must [ 
	$.errorDetails[0] must haveKey("code")
	, $.errorDetails[0].code must equalTo(503)
]