import React from "react"
import PropTypes from "prop-types"
class Page extends React.Component {
  render () {
    return (
      <div class="alert alert-success" role="alert">
         <h4 class="alert-heading">{this.props.title}</h4>
        <p>{this.props.description}.</p>
</div>
    );
  }
}


export default Page
