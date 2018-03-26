import React from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';

const Home = () => <h1>Home</h1>;
const User = () => <h1>User</h1>;
const Restaurant = () => <h1>Restaurant</h1>;
const Manager = () => <h1>Manager</h1>;

const Child = ({ match }) => (
  <div>
    <h3>ID: {match.params.model} </h3>
  </div>
);

const App = () => (
  <Router>
    <div>
      <Link to="/">Home</Link>
      <Link to="/user">User</Link>
      <Link to="/restaurant">Restaurant</Link>
      <Link to="/manager">Manager</Link>
      <hr />

      <Route exact path="/" component={Home} />
      <Route path="/user" component={User} />
      <Route path="/restaurant" component={Restaurant} />
      <Route path="/manager" component={Manager} />
      <Route path="/:model" component={Child} />
    </div>
  </Router>
);

export default App;
