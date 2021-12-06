%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  Status: "Failure",
  Errors: [
    {
      Error: {
        Severity: "Fatal",
        Code: 400,
        Summary: "Request Failed.",
        Messages: [
          ""
        ]
      }
    }
  ]
})