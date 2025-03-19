group
('LoginAPiTest
'
, () {
test('returns userEntity when http response is successful', () async {
// Mock the API call to return a json response with http status 200 Ok //
final mockHTTPClient = MockClient((request) async {
var response = {
"status": true,
"message": null,
"data": {
"id": 0,
"user_id": "1",
"user_email": "udeanmbano@gmail.com",
"access_token": {
"tokenString":
"eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoidWRlYW5tYmFub0BnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6InVkZWFubWJhbm9AZ21haWwuY29tIiwiVXNlcklkIjoiMSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJleHAiOjE2NzQyNjM2NTQsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcxODYvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzE4Ni8ifQ.pr_QSOEnhTJR7f_HMBzhH7oYMm9VAVOqC2RbuxqsBQM",
"expireAt": "2023-01-21T03:14:14.6375769+02:00"
},
"refresh_token": {
"username": "udeanmbano@gmail.com",
"tokenString": "Ruxf8UmZFX146/phLi2ObW4LJO9uuTKgBxPPW7LDLLg=",
"expireAt": "2023-01-17T23:14:14.6375769+02:00"
},
"user_role": "2"
},
"code": "OK",
"warnings": null
};

return Response(jsonEncode(response), 200);
});
// Check whether login function returns
// login response will be user Entity

auth.httpClient=mockHTTPClient;
expect(
await auth.login( "x@mail.com", "Pass123@")
    .then((value) => value?.code.toString()),
"OK");
});

test('return error message when http response is unsuccessful', () async {
// Mock the API call to return a json response with http status 200 Ok //
final mockHTTPClient = MockClient((request) async {
var response = {
"status": true,
"message": null,
"data": null,
"code": "Unauthorized",
"warnings": null
};

return Response(jsonEncode(response), 401);
});
// Check whether login function returns
// login response will be user Entity

auth.httpClient=mockHTTPClient;
expect(
await auth.login("x@mail.com", "Pass123@")
    .then((value) => value?.code.toString()),
"Unauthorized");
});
}) {
// TODO: implement group
throw UnimplementedError();
}
