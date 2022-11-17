// check docs inside of graphql editor
http://localhost:1337/graphql

https://docs.strapi.io/developer-docs/latest/developer-resources/database-apis-reference/rest/api-parameters.html
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



// Authenticated data Fetch after login using JWT
// udemy section-6 48-video
query HomePage {
  homePage {
    data {
      id
      attributes {
        title
        hero {
          id
          callAction
          image {
            data {
              id
              attributes {
                url
              }
            }
           
          }
        }
      }
    }
  }
}


# By adding in "HTTP Headers (1)" bottom
{"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjY4NjY5OTYyLCJleHAiOjE2NzEyNjE5NjJ9.57tGtWeDQHaaQKzcE5uKZJcX5N-lcCxepG8WNgsqVMQ"}



// getting nested components Via Graphql(After Login Auth)

query HomePageNestedComponents {
  homePage {
    data {
      id
      attributes {
        title
        hero {
          id
          callAction
          image {
            data {
              id
              attributes {
                url
              }
            }
          }
          # "buttons" is nested component
          buttons {
            label
            url
          }
        }
        # "postsSelection" is nested component
        postsSelection {
          featuredPosts {
            data {
              attributes {
                title
                content
              }
            }
          }
        }
        seo {
          seoTitle
          seoDescription
        }
        # "servicesPreview" is nested component
        servicesPreview {
          id
          services {
            data {
              id
              attributes {
                name
              }
            }
          }
        }
        # "featuredCourse" is nested component
        featuredCourse {
          id
          heading
          announcement
          course {
            data {
              attributes {
                title
              }
            }
          }
        }
      }
      
    }
    
  }
}


// Geeting Dynamic Zones(After Login Auth)

query HomePageDynamicZone {
  homePage {
    data {
      id
      attributes {
        title
        hero {
          id
          callAction
        }
        seo {
          seoTitle
          seoDescription
        }
        # DynamicZone fetch
        dynamicHomeSection{
          # if
          ...on ComponentLayoutMission{
            heading
            showLogo
            content
          }
          # if otherwise
          ...on ComponentLayoutNewsletterForm {
            heading
            subHeading
          }
        }
        
      }
      
    }
    
  }
}




// Graphql Mutation For # create
mutation createPost {
  createPost(
    data: { 
      title: "Hello from Graphql Testing", 
      slug: "hello-from-graphql",
      content: "The implementation of the mutations also supports relational attributes. For example, you can create a new User and attach many Restaurant to it by writing your query",
    }) {
      # To fetch after create
    data {
      id
      attributes {
        title
        slug
        content
      }
    }
  }
}

// Graphql Mutation For # Update
mutation updatePost {
  updatePost(
    id: "7", 
    data: { 
      title: "Graphql depending on the relationship",
      slug: "graphql-depending-relaion"
    }) {
    data {
      id
      attributes {
        title
        slug
      }
    }
  }
}

// Graphql Mutation For # Update & Published

mutation updatePostPublished {
  updatePost(
    id: "7", 
    data: { 
      title: "Graphql depending on the relationship",
      slug: "graphql-depending-relaion",
      # Follow time format
      publishedAt: "2022-11-17T04:23:15+01:00"
    }) {
    data {
      id
      attributes {
        title
        slug
      }
    }
  }
}

// Graphql Mutation For # Delete
mutation deletePost {
  deletePost(id: 7) {
    data {
      id
      attributes {
        title
        slug
      }
    }
  }
}

// Graphql Update Single Type Collection(not need id)
mutation updateHomePageSingleType {
  updateHomePage( 
    data: { 
      title: "Home Page Main Strapi"
    }) {
    data {
      id
      attributes {
        title
      }
    }
  }
}


// Graphql Operators
# Filter
query OperatorPosts {
  posts(filters: { title: {contains: "strapi"} }) {
    data {
      attributes {
        title
        slug
      }
    }
  }
}

# Sorting
query OperatorPosts {
  posts(sort: "title:asc") {
    data {
      attributes {
        title
        slug
      }
    }
  }
}
query OperatorPosts {
  posts(sort: "content:desc") {
    data {
      attributes {
        content
        slug
      }
    }
  }
}

# Array Sorting
query OperatorPosts {
  posts(sort: ["title:asc", "content:desc"]) {
    data {
      attributes {
        content
        title
      }
    }
  }
}

# Pagination
query OperatorPosts {
  posts(pagination: { page: 1, pageSize: 10 }) {
    data {
      attributes {
        content
        title
      }
    }
  }
}

query OperatorPosts {
  posts(pagination: { page: 1, pageSize: 2 }) {
    data {
      attributes {
        content
        title
      }
    }
    meta {
      pagination {
        page
        pageSize
        pageCount
        total
        __typename
      }
    }
  }
}

# Publication State
Mode: PREVIEW(Draft & Published)

query OperatorPosts {
  posts(publicationState: PREVIEW) {
    data {
      attributes {
        content
        title
      }
    }
    meta {
      pagination {
        page
        pageSize
        pageCount
        total
        __typename
      }
    }
  }
}

Mode: LIVE(Published)

query OperatorPosts {
  posts(publicationState: LIVE) {
    data {
      attributes {
        content
        title
      }
    }
    meta {
      pagination {
        page
        pageSize
        pageCount
        total
        __typename
      }
    }
  }
}















