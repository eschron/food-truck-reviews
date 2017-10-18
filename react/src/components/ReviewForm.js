import React from 'react';
import ReactRadioButtonGroup from 'react-radio-button-group';

const ReviewForm = props => {

  return (
    <form className="callout" onSubmit={props.handleSubmit}>
      <label>
        Rating
        <ReactRadioButtonGroup
          options={['1', '2', '3', '4', '5']}
          name='rating'
          isStateful={true}
          value={props.rating}
          onChange={props.handleRatingChange}
          fireOnMount={false}
        />
      </label>

      <label>Description
        <textarea
          name='description'
          type='text'
          value={props.description}
          onChange={props.handleDescriptionChange}
        />
      </label>

      <div className="button-group">
        <input className="button" type="submit" value="Submit" />
      </div>
    </form>
  );
}

export default ReviewForm;
