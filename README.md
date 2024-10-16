# Todo API

This is a simple C# Todo API built with .NET 8.0. It provides CRUD (Create, Read, Update, Delete) operations for managing todo items. The API uses an in-memory database to store todo items during runtime.

## Prerequisites

Make sure you have the following installed:

- Docker (version 20.10 or later)
- .NET SDK (optional, for local development)

## Build and Run the Dockerfile

### 1. Clone the repository

First, clone this repository to your local machine:

```bash
git clone <repository_url>
cd <repository_folder>
```

### 2. Build the Docker image

In the project directory (where your `Dockerfile` is located), run the following command to build the Docker image:

```bash
docker build -t todo-api .
```

This command will build the image using the Dockerfile, tagging it as todo-api.

### 3. Run the Docker container

Once the image is built, you can run the container:

```bash
docker run -d --rm -p 8080:8080 todo-api
```

This command will:

- Run the container in detached mode (`-d`)
- Remove the container after it shuts down (`--rm`)
- Map port 8080 on the host to port 8080 in the container (`-p 8080:8080`)

### 4. Check the health of the API

You can check the API's health by sending a GET request to the /healthz endpoint:

```bash
curl http://localhost:8080/healthz
```

You should see the response: `"Healthy"`.

## API Endpoints

The following API endpoints are available:

### 1. Get All Todos

`GET /todoitems/`

This endpoint retrieves all the todo items.

**Response example:**

```json
[
  {
    "id": 1,
    "name": "Complete interview task",
    "isComplete": true
  },
  {
    "id": 2,
    "name": "Accept job offer",
    "isComplete": true
  }
]
```

### 2. Get Completed Todos

`GET /todoitems/complete`

This endpoint retrieves all completed todo items.

**Response example:**

```json
[
  {
    "id": 1,
    "name": "Complete interview task",
    "isComplete": true
  },
  {
    "id": 2,
    "name": "Accept job offer",
    "isComplete": true
  }
]
```

### 3. Get a Single Todo by ID

`GET /todoitems/{id}`

This endpoint retrieves a specific todo item by its ID.

**Response example:**

```
{
  "id": 2,
  "name": "Accept job offer",
  "isComplete": true
}
```

If the item with the specified ID doesn't exist, the API will return a `404 Not Found` status.

### 4. Create a New Todo

`POST /todoitems/`

This endpoint creates a new todo item.

**Request body example:**

```
{ "name": "Finish project", "isComplete": false }
```

**Response example:**

```
{ "id": 3, "name": "Finish project", "isComplete": false }
```

The API will return the newly created todo item with its assigned ID.

### 5. Update a Todo

`PUT /todoitems/{id}`

This endpoint updates an existing todo item by its ID.

**Request body example:**

```
{ "name": "Start working", "isComplete": true }
```

**Response:**

The API returns `204 No Content` if the update is successful.

If the item with the specified ID doesn't exist, the API will return a `404 Not Found` status.

### 6. Delete a Todo

`DELETE /todoitems/{id}`

This endpoint deletes a todo item by its ID.

**Response:**

The API returns `204 No Content` if the deletion is successful.

If the item with the specified ID doesn't exist, the API will return a `404 Not Found` status.
