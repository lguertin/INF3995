POST /testForm01 HTTP/1.1
Host: localhost:8080
User-Agent: curl/7.52.1
Accept: */*
Content-Length: 1413
Expect: 100-continue
Content-Type: multipart/form-data; boundary=xxx---------------------6d8cd9b0969641f9

--xxx---------------------6d8cd9b0969641f9
Content-Disposition: form-data; name="tripId"

7601e0be-8eca-450a-82a1-9efde3ce6c6f
--xxx---------------------6d8cd9b0969641f9
Content-Disposition: form-data; name="busSeatIdList"

|ae871414-e617-4699-9f39-439b27ec00d9--30|ae871414-e617-4699-9f39-439b27ec00d9--31|ae871414-e617-4699-9f39-439b27ec00d9--32|ae871414-e617-4699-9f39-439b27ec00d9--33|ae871414-e617-4699-9f39-439b27ec00d9--34
--xxx---------------------6d8cd9b0969641f9
Content-Disposition: form-data; name="busSeatPriceIdList"

|1582c658-14f0-446b-a5eb-62dbd5e5f0f8|1582c658-14f0-446b-a5eb-62dbd5e5f0f8|1582c658-14f0-446b-a5eb-62dbd5e5f0f8|1582c658-14f0-446b-a5eb-62dbd5e5f0f8|1582c658-14f0-446b-a5eb-62dbd5e5f0f8
--xxx---------------------6d8cd9b0969641f9
Content-Disposition: form-data; name="clientFullName"


--xxx---------------------6d8cd9b0969641f9
Content-Disposition: form-data; name="displayOnlyTripDestiny_disabled"

Poços de Caldas - MG
--xxx---------------------6d8cd9b0969641f9
Content-Disposition: form-data; name="displayOnlyTripDestiny"

Poços de Caldas - MG
--xxx---------------------6d8cd9b0969641f9
Content-Disposition: form-data; name="displayOnlyBusSeats_disabled"

30; 31; 32; 33; 34
--xxx---------------------6d8cd9b0969641f9
Content-Disposition: form-data; name="displayOnlyBusSeats"

30; 31; 32; 33; 34
--xxx---------------------6d8cd9b0969641f9--
