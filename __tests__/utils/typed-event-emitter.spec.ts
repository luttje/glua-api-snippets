import { TypedEventEmitter } from '../../src/utils/typed-event-emitter';
import { jest } from '@jest/globals';

describe('TypedEventEmitter', () => {
  it('should emit and receive events', () => {
    const emitter = new TypedEventEmitter<{ test: [string] }>();
    const handler = jest.fn();

    emitter.on('test', handler);
    emitter.emit('test', 'hello');

    expect(handler).toHaveBeenCalledWith('hello');
  });

  it('should not receive events after being removed', () => {
    const emitter = new TypedEventEmitter<{ test: [string] }>();
    const handler = jest.fn();

    emitter.on('test', handler);
    emitter.off('test', handler);
    emitter.emit('test', 'hello');

    expect(handler).not.toHaveBeenCalled();
  });
});