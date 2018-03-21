# README

API endpoint:

  POST /v1/flights/paths


Example 1:

    Request:
      [["SFO", "EWR"]]
    Response:
      {
        "airport_code": ["SFO","EWR"],
        "ordered_paths": [["SFO","EWR"]]
      }


Example 2:

    Request:
      [["ATL", "EWR"], ["SFO", "ATL"]]
    Response:
      {
        airport_code: ["SFO", "EWR"],
        ordered_paths: [["SFO", "EWR"]]
      }

Example 3:

    Request:
      [["IND", "EWR"], ["SFO", "ATL"], ["GSO", "IND"], ["ATL", "GSO"]]
    Response
      {
        airport_code: ['SFO', 'EWR'],
        ordered_paths: [  
            ["SFO", "ATL"],
            ["ATL", "GSO"],
            ["GSO", "IND"],
            ["IND", "EWR"]
          ]
      }