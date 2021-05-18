# JSON to CSV converter

This library is destined to receive a json file and return a CSV.
Example of entry :
```json
[
  {
    "id": 0,
    "email": "colleengriffith@quintity.com",
    "tags": [
      "consectetur",
      "quis"
    ],
    "profiles": {
      "facebook": {
        "id": 0,
        "picture": "//fbcdn.com/a2244bc1-b10c-4d91-9ce8-184337c6b898.jpg"
      },
      "twitter": {
        "id": 0,
        "picture": "//twcdn.com/ad9e8cd3-3133-423e-8bbf-0602e4048c22.jpg"
      }
    }
  }
]
```
This JSON will be converted to CSV like this :
```
id,email,tags,profiles.facebook.id,profiles.facebook.picture,profiles.twitter.id,profiles.twitter.picture
0,colleengriffith@quintity.com,"consectetur,quis",0,//fbcdn.com/a2244bc1-b10c-4d91-9ce8-184337c6b898.jpg,0,//twcdn.com/ad9e8cd3-3133-423e-8bbf-0602e4048c22.jpg
```
* Ruby version  
  This lib is based on Ruby 2.7.1
  

* System dependencies  
  CSV and JSON libraries


* Run the test suite :
  ```shell
    bundle exec rspec
  ```
  
