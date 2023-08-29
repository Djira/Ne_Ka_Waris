import React from "react"
import PropTypes from "prop-types"
class Welcome extends React.Component {
  render () {
    return (
      <div class="card text-center">

  <div class="card-body">
    <h5 class="card-title">{this.props.title}</h5>
    <p class="card-text top">{this.props.description}</p>
    
  </div>
  
</div>
    );
  }
}


export default Welcome
