import { useEffect, useState } from "react";
import "./App.css";
import axios from "axios";

const App = () => {
  const [users, setUsers] = useState([]);
  useEffect(() => {
    axios.get("/api/users").then((response) => {
      setUsers(response.data);
    });
  }, []);
  return (
    <div className="app">
      <h1>Users List: </h1>
      <ul>
        {users.map((user) => (
          <li key={user.id}>{user.name}</li>
        ))}
      </ul>
    </div>
  );
};

export default App;
