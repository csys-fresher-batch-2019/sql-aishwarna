#table design for railway reservation management
##table 1
->trains

| train_id | train_name      | journey_starts | journey_ends | birth_type | status        |
|----------|-----------------|----------------|--------------|------------|---------------|
| 1234     | kovai_express   | chennai        | coimbatore   | sitting    | Available     |
| 5678     | yercard_express | erode          | chennai      | sleeper    | Waiting_List  |
| 3245     | pandian_express | trichy         | chennai      | ac_sleeper | Not_Available |


#table 2
--->passenger

| passenger_id | passenger_name | train_id | gender | contact_number | adhar_number |
|--------------|----------------|----------|--------|----------------|--------------|
| 1111         | chandra        | 1234     | female | 9937808765     | 1000549873   |
| 2222         | kailasam       | 5678     | male   | 9600928765     | 100065398822 |
| 3333         | aishwaryaa     | 3245     | female | 9003711907     | 188770487634 |









