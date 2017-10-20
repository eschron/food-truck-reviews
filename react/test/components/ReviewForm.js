import React from 'react';
import ReviewForm from '../../src/components/ReviewForm';

describe('ReviewForm', () => {
  let wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(<ReviewForm />);
  });

  it('should render a form', () => {
    expect(wrapper.find('form')).toBePresent();
  });

  it('should render radio buttons', () => {
    expect(wrapper.find('input[type="radio"]').length).toEqual(5);
  });

  it('should render a text area', () => {
    expect(wrapper.find('textarea')).toBePresent();
  });

  it('should render a submit button', () => {
    expect(wrapper.find('input[type="submit"]')).toBePresent();
  });
})
