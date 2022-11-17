// check docs inside of graphql editor
http://localhost:1337/graphql
# Write your query or mutation here

// Fetch multiple entries
query FetchMultiPosts {
  posts {
    data {
      id
      attributes {
        title
        content
        cover {
          data {
            id
            attributes {
              url
            }
          }
        }
        tags {
          data {
            attributes{
              name
              slug
            }
          }
        }
      }
    }
    meta {
      __typename
      pagination {
        page
        pageSize
        pageCount
      }
    }
  }
}


// Fetch a single entry
query SinglePostById {
  post(id: 1) {
    data {
      id
      attributes {
        title
      }
    }
  }
}

 {
  post(id: 1) {
    data {
      id
      attributes {
        title
      }
    }
  }
}



// Graphql Register/ login mutation

# Mutation Register (password min- 6char always)
mutation {
  register(
    input: { 
      username: "Rahul", 
      email: "rahul@yahoo.com", 
      password: "Rahul@1234" }
  ) {
    jwt
    user {
      username
      email
    }
  }
}

  // for register
  # jwt: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjY4NjY5NTM2LCJleHAiOjE2NzEyNjE1MzZ9.cvbCT2ivZjavngFnwSUpKd-cjcGziA_FAHEafJPcv9c

# Mutation Login (password min- 6char always)
mutation {
  login(
    input: { 
    identifier: "rahul@yahoo.com", 
    password: "Rahul@1234" }) {
    jwt
  }
}


  // For login
  # JWT: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjY4NjY5OTYyLCJleHAiOjE2NzEyNjE5NjJ9.57tGtWeDQHaaQKzcE5uKZJcX5N-lcCxepG8WNgsqVMQ





