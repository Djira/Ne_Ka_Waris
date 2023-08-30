import React from "react"
import PropTypes from "prop-types"
import ReactTable from 'react-table';

class Home extends React.Component {
  render () {
    return (
      <ReactTable
      data={this.props.caisses}
      columns={columns}
      defaultPageSize={10}
      className="-striped -highlight"
    />
    );
  }
}

export default Home

