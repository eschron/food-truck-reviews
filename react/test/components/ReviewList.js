import React from 'react';
import ReviewList from '../../src/components/ReviewList';
import ReviewContainer from '../../src/containers/ReviewContainer';

describe('ReviewList', () => {
  let wrapper;
  let reviews = [
    {
      id: 0,
      rating: 5,
      description: 'the description'
    }
  ]

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(<ReviewList id="app" reviews={reviews}/>);
  });

  it('should render the reviews', () => {
    expect(wrapper.find(ReviewContainer).length).toEqual(1);
  });
})
