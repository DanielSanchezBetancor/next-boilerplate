import { renderHook } from '@icar-test/utils/test-utils';
import useREPLACE from './useREPLACE';
import { CORRECT_MOCK } from '../mocks/__mock';

const setup = () => {
  const hookResult = renderHook(useREPLACE);

  return {
    hookResult,
  };
};

describe('REPLACE Test Suite', () => {
  it('should give values', () => {
    const utils = setup();
    const {} = utils.hookResult.result.current;
  });
});
