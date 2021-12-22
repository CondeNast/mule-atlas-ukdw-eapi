%dw 2.0
import * from dw::test::Asserts
---
payload  must equalTo({
  "Status": "Failure",
  "Errors": [
    {
      "Error": {
        "Summary": "FLI update error",
        "Severity": "Severe",
        "Messages": [
          "Missing FLI record"
        ],
        "Code": "4"
      },
      "EntityId": {
        "Type": "FLI",
        "ReferenceIds": [
          {
            "SystemId": "BM",
            "Id": "FLI-00002344-1-1"
          }
        ]
      }
    }
  ]
})