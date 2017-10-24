import ReviewsContainer from '../../src/containers/ReviewsContainer';
import ReviewFormContainer from '../../src/containers/ReviewFormContainer';
import ReviewList from '../../src/components/ReviewList';

import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('ReviewsContainer', () => {
  let wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    spyOn(ReviewsContainer.prototype, 'handleClick').and.callThrough();
    let params = {id: 434324}
    wrapper = mount(<ReviewsContainer params={ params } />);
  });

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({
      allReviews: [],
      review: {},
      addReview: false
    });
  });

  it('should render a Reviews component with props', () => {
    expect(wrapper.find(ReviewList)).toBePresent();
    expect(wrapper.find(ReviewList).props()).toEqual({
      reviews: wrapper.state().allReviews,
      loadReviews: jasmine.any(Function)
    })
  })

  it('should render a button to add a review', () => {
    expect(wrapper.find('input')).toBePresent();
    expect(wrapper.find('input').props().value).toEqual('Add a review');
  })

  it('should render a review form when button clicked', () => {
    wrapper.find('input').simulate('click');
    expect(wrapper.find(ReviewFormContainer)).toBePresent();
    wrapper.simulate('click')
  })
})
