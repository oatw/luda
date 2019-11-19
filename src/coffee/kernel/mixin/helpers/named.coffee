import createMounter from '../../base/create-mounter.coffee'



named = {}

mount = createMounter named, 'mixing'

unmount = (name) -> delete named[name]

get = (name) -> named[name] or {}



export {mount, unmount, get, named}