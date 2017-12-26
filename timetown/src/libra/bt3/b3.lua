--
-- Author: zen.zhao88@gmail.com
-- Date: 2015-12-02 15:35:49
-- BehaviorTree3 init && require lua file
b3                    = {}
b3.Com                = import('.Com')

--core
b3.BaseNode           = import('.Core.BaseNode')
b3.Action             = import('.Core.Action')
b3.Decorator          = import('.Core.Decorator')
b3.Condition          = import('.Core.Condition')
b3.Composite          = import('.Core.Composite')
b3.BehaviorTree       = import('.Core.BehaviorTree')
b3.Blackborad         = import('.Core.Blackborad')
b3.Tick               = import('.Core.Tick')

--Action
b3.Error              = import('.Actions.Error')
b3.Failer             = import('.Actions.Failer')
b3.Runner             = import('.Actions.Runner')
b3.Succeeder          = import('.Actions.Succeeder')
b3.Wait               = import('.Actions.Wait')

--Composites
b3.Sequence           = import('.Composites.Sequence')
b3.Priority           = import('.Composites.Priority')
b3.MemSequence        = import('.Composites.MemSequence')
b3.MemPriority        = import('.Composites.MemPriority')
b3.WeightSelector     = import('.Composites.WeightSelector')

--Decorators
b3.Inverter           = import('.Decorators.Inverter')
b3.Limiter            = import('.Decorators.Limiter')
b3.MaxTime            = import('.Decorators.MaxTime')
b3.Repeater           = import('.Decorators.Repeater')
b3.RepeatUntilFailure = import('.Decorators.RepeatUntilFailure')
b3.RepeatUntilSuccess = import('.Decorators.RepeatUntilSuccess')
