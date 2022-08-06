function Home({ user }) {
    if (user) {
      return <h1>Welcome  {user.username }!</h1>;
    }
  }

  
  export default Home;
  