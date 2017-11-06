import React from 'react'
import { Redirect } from 'react-router-dom'

function authorize(RenderedComponent){

  return class extends React.Component {


    render() {


      if (localStorage.getItem('jwt') && this.props.location.pathname === "/login") {

        return <Redirect to="/"/>
      } else if (!localStorage.getItem('jwt') && this.props.location.pathname !== "/login") {

        return <Redirect to="/login"/>
      } else {

        return <RenderedComponent {...this.props}/>
      }
    }
  }
}


export default authorize
