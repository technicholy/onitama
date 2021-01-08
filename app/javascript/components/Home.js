import React, { Component } from "react";
import Registration from "./auth/Registration";
import Login from "./auth/Login";
import LandingPage from "./LandingPage";
import axios from "axios";

export default class Home extends Component {
  handleSuccessfulAuth = (data) => {
    this.props.handleLogin(data);
    this.props.history.push("/dashboard");
  };

  handleLogoutClick = (_) => {
    axios
      .delete("http://localhost:3000/logout", { withCredentials: true })
      .then((res) => {
        this.props.handleLogout();
      })
      .catch((err) => console.error(err));
  };
  render() {
    return (
      <div>
        <button type="button" onClick={() => this.handleLogoutClick()}>
          Logout
        </button>
        <LandingPage handleSuccessfulAuth={this.handleSuccessfulAuth} />
      </div>
    );
  }
}
