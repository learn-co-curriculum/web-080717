import React from "react";
import { connect } from "react-redux";
import { logOutUser } from "../actions";

class Profile extends React.Component {
  handleLogout = () => {
    localStorage.removeItem("jwt");
    this.props.logOutUser();
  };

  render() {
    console.log(process.env.REACT_APP_GOOGLE_PLACES_API);
    return (
      <div>
        <h1>Hello, {this.props.username}</h1>

        <button onClick={this.handleLogout}>Logout</button>
      </div>
    );
  }
}

const mapStateToProps = state => ({ username: state.usersReducer.username });

export default connect(mapStateToProps, { logOutUser })(Profile);
