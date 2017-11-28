import React from "react";
import { connect } from "react-redux";
import { loginUser, signUpUser } from "../actions";
import { Form, Divider, Header, Container } from "semantic-ui-react";

class LoginForm extends React.Component {
  state = {
    username: "",
    password: "",
    newUsername: "",
    newPassword: "",
    reEnterPassword: ""
  };

  handleChange = event => {
    console.log(event.target.name);
    this.setState({ [event.target.name]: event.target.value });
  };

  handleLoginSubmit = event => {
    event.preventDefault();
    this.props.loginUser(this.state.username, this.state.password);
  };

  handleSignUpSubmit = event => {
    event.preventDefault();
    this.props.signUpUser(this.state.newUsername, this.state.newPassword);
  };

  render() {
    return (
      <Container>
        {this.props.errorMessage ? <div>{this.props.errorMessage}</div> : null}
        <Header>Log In</Header>
        <Form onSubmit={this.handleLoginSubmit}>
          <Form.Group widths="equal">
            <Form.Input
              name="username"
              label="Username"
              type="text"
              value={this.state.username}
              onChange={this.handleChange}
            />
            <Form.Input
              name="password"
              label="Password"
              type="password"
              value={this.state.password}
              onChange={this.handleChange}
            />
          </Form.Group>
          <Form.Button type="Submit">Log In</Form.Button>
        </Form>

        <Divider horizontal>Or</Divider>
        <Header>Sign Up</Header>
        <Form>
          <Form.Group widths="equal">
            <Form.Input
              name="newUsername"
              label="Username"
              type="text"
              value={this.state.newUsername}
              onChange={this.handleChange}
            />
            <Form.Input
              name="newPassword"
              label="Password"
              type="password"
              value={this.state.newPassword}
              onChange={this.handleChange}
            />
            <Form.Input
              name="reEnterPassword"
              label="Re-Enter Password"
              type="password"
              value={this.state.reEnterPassword}
              onChange={this.handleChange}
            />
          </Form.Group>
          <Form.Button onClick={this.handleSignUpSubmit}>Sign Up</Form.Button>
        </Form>
      </Container>
    );
  }
}

const mapStateToProps = state => {
  return {
    ...state.usersReducer
  };
};

export default connect(mapStateToProps, { loginUser, signUpUser })(LoginForm);
