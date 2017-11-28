import React from "react";
import { Route, withRouter, Switch } from "react-router-dom";
import ProfileComponent from "./components/Profile";
import LoginForm from "./components/LoginForm";
import Navigation from "./components/Navigation";
import { connect } from "react-redux";
import {
  getLocation,
  getStores,
  setLocation,
  getCurrentUser,
  logOutUser
} from "./actions";
import authorize from "./authorize";

class App extends React.Component {
  componentDidMount() {
    if (localStorage.getItem("jwt")) {
      this.props.getCurrentUser();
    }
  }

  render() {
    console.log(this.props);
    const AuthLoginForm = authorize(LoginForm);
    const AuthProfile = authorize(ProfileComponent);

    return (
      <div className="App">
        <Navigation />

        <Switch>
          <Route
            exact
            path="/"
            render={() => (
              <div>
                hey{" "}
                {this.props.user.get("loading")
                  ? "Downloading Internet..."
                  : this.props.user.get("username")}
                <div>
                  {this.props.location.get("loadingLocation")
                    ? "Finding Location"
                    : this.props.location.get("loadingStores")
                      ? "Finding Stores"
                      : "Stores Found"}
                </div>
              </div>
            )}
          />
          <Route exact path="/map" render={() => <div>Mapppppppp</div>} />
          <Route exact path="/profile" component={AuthProfile} />
          <Route
            exact
            path="/login"
            render={props => <AuthLoginForm onSubmit={this.logIn} {...props} />}
          />
          <Route render={() => <div>No MATTTTTTCH</div>} /> />
        </Switch>

        <h1>
          <span>{this.props.location.get("latitude")}</span>,{" "}
          <span>{this.props.location.get("longitude")}</span>
        </h1>
      </div>
    );
  }
}

const mapStateToProps = state => {
  return {
    user: state.get("usersReducer"),
    location: state.get("locationReducer"),
    stores: state.get("storesReducer")
  };
};

export default withRouter(
  connect(mapStateToProps, {
    getCurrentUser,
    getLocation,
    getStores,
    logOutUser
  })(App)
);

//
