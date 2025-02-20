function ARKStepCreate(fe::ARKRhsFn, fi::ARKRhsFn, t0::realtype, y0::N_Vector)
    ccall((:ARKStepCreate, libsundials_arkode), ARKStepMemPtr, (ARKRhsFn, ARKRhsFn, realtype, N_Vector), fe, fi, t0, y0)
end

function ARKStepCreate(fe, fi, t0, y0)
    __y0 = convert(NVector, y0)
    ARKStepCreate(ARKRhsFn_wrapper(fe), ARKRhsFn_wrapper(fi), t0, convert(N_Vector, __y0))
end

function ARKStepResize(arkode_mem, ynew::N_Vector, hscale::realtype, t0::realtype, resize::ARKVecResizeFn, resize_data)
    ccall((:ARKStepResize, libsundials_arkode), Cint, (ARKStepMemPtr, N_Vector, realtype, realtype, ARKVecResizeFn, Ptr{Cvoid}), arkode_mem, ynew, hscale, t0, resize, resize_data)
end

function ARKStepResize(arkode_mem, ynew, hscale, t0, resize, resize_data)
    __ynew = convert(NVector, ynew)
    ARKStepResize(arkode_mem, convert(N_Vector, __ynew), hscale, t0, resize, resize_data)
end

function ARKStepReInit(arkode_mem, fe::ARKRhsFn, fi::ARKRhsFn, t0::realtype, y0::N_Vector)
    ccall((:ARKStepReInit, libsundials_arkode), Cint, (ARKStepMemPtr, ARKRhsFn, ARKRhsFn, realtype, N_Vector), arkode_mem, fe, fi, t0, y0)
end

function ARKStepReInit(arkode_mem, fe, fi, t0, y0)
    __y0 = convert(NVector, y0)
    ARKStepReInit(arkode_mem, ARKRhsFn_wrapper(fe), ARKRhsFn_wrapper(fi), t0, convert(N_Vector, __y0))
end

function ARKStepSStolerances(arkode_mem, reltol::realtype, abstol::realtype)
    ccall((:ARKStepSStolerances, libsundials_arkode), Cint, (ARKStepMemPtr, realtype, realtype), arkode_mem, reltol, abstol)
end

function ARKStepSVtolerances(arkode_mem, reltol::realtype, abstol::N_Vector)
    ccall((:ARKStepSVtolerances, libsundials_arkode), Cint, (ARKStepMemPtr, realtype, N_Vector), arkode_mem, reltol, abstol)
end

function ARKStepSVtolerances(arkode_mem, reltol, abstol)
    __abstol = convert(NVector, abstol)
    ARKStepSVtolerances(arkode_mem, reltol, convert(N_Vector, __abstol))
end

function ARKStepWFtolerances(arkode_mem, efun::ARKEwtFn)
    ccall((:ARKStepWFtolerances, libsundials_arkode), Cint, (ARKStepMemPtr, ARKEwtFn), arkode_mem, efun)
end

function ARKStepResStolerance(arkode_mem, rabstol::realtype)
    ccall((:ARKStepResStolerance, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, rabstol)
end

function ARKStepResVtolerance(arkode_mem, rabstol::N_Vector)
    ccall((:ARKStepResVtolerance, libsundials_arkode), Cint, (ARKStepMemPtr, N_Vector), arkode_mem, rabstol)
end

function ARKStepResVtolerance(arkode_mem, rabstol)
    __rabstol = convert(NVector, rabstol)
    ARKStepResVtolerance(arkode_mem, convert(N_Vector, __rabstol))
end

function ARKStepResFtolerance(arkode_mem, rfun::ARKRwtFn)
    ccall((:ARKStepResFtolerance, libsundials_arkode), Cint, (ARKStepMemPtr, ARKRwtFn), arkode_mem, rfun)
end

function ARKStepSetLinearSolver(arkode_mem, LS::SUNLinearSolver, A::SUNMatrix)
    ccall((:ARKStepSetLinearSolver, libsundials_arkode), Cint, (ARKStepMemPtr, SUNLinearSolver, SUNMatrix), arkode_mem, LS, A)
end

function ARKStepSetMassLinearSolver(arkode_mem, LS::SUNLinearSolver, M::SUNMatrix, time_dep::Cint)
    ccall((:ARKStepSetMassLinearSolver, libsundials_arkode), Cint, (ARKStepMemPtr, SUNLinearSolver, SUNMatrix, Cint), arkode_mem, LS, M, time_dep)
end

function ARKStepSetMassLinearSolver(arkode_mem, LS, M, time_dep)
    ARKStepSetMassLinearSolver(arkode_mem, LS, M, convert(Cint, time_dep))
end

function ARKStepRootInit(arkode_mem, nrtfn::Cint, g::ARKRootFn)
    ccall((:ARKStepRootInit, libsundials_arkode), Cint, (ARKStepMemPtr, Cint, ARKRootFn), arkode_mem, nrtfn, g)
end

function ARKStepRootInit(arkode_mem, nrtfn, g)
    ARKStepRootInit(arkode_mem, convert(Cint, nrtfn), g)
end

function ARKStepSetDefaults(arkode_mem)
    ccall((:ARKStepSetDefaults, libsundials_arkode), Cint, (ARKStepMemPtr,), arkode_mem)
end

function ARKStepSetOptimalParams(arkode_mem)
    ccall((:ARKStepSetOptimalParams, libsundials_arkode), Cint, (ARKStepMemPtr,), arkode_mem)
end

function ARKStepSetOrder(arkode_mem, maxord::Cint)
    ccall((:ARKStepSetOrder, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, maxord)
end

function ARKStepSetOrder(arkode_mem, maxord)
    ARKStepSetOrder(arkode_mem, convert(Cint, maxord))
end

function ARKStepSetInterpolantType(arkode_mem, itype::Cint)
    ccall((:ARKStepSetInterpolantType, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, itype)
end

function ARKStepSetInterpolantType(arkode_mem, itype)
    ARKStepSetInterpolantType(arkode_mem, convert(Cint, itype))
end

function ARKStepSetInterpolantDegree(arkode_mem, degree::Cint)
    ccall((:ARKStepSetInterpolantDegree, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, degree)
end

function ARKStepSetInterpolantDegree(arkode_mem, degree)
    ARKStepSetInterpolantDegree(arkode_mem, convert(Cint, degree))
end

function ARKStepSetDenseOrder(arkode_mem, dord::Cint)
    ccall((:ARKStepSetDenseOrder, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, dord)
end

function ARKStepSetDenseOrder(arkode_mem, dord)
    ARKStepSetDenseOrder(arkode_mem, convert(Cint, dord))
end

function ARKStepSetNonlinearSolver(arkode_mem, NLS::SUNNonlinearSolver)
    ccall((:ARKStepSetNonlinearSolver, libsundials_arkode), Cint, (ARKStepMemPtr, SUNNonlinearSolver), arkode_mem, NLS)
end

function ARKStepSetLinear(arkode_mem, timedepend::Cint)
    ccall((:ARKStepSetLinear, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, timedepend)
end

function ARKStepSetLinear(arkode_mem, timedepend)
    ARKStepSetLinear(arkode_mem, convert(Cint, timedepend))
end

function ARKStepSetNonlinear(arkode_mem)
    ccall((:ARKStepSetNonlinear, libsundials_arkode), Cint, (ARKStepMemPtr,), arkode_mem)
end

function ARKStepSetExplicit(arkode_mem)
    ccall((:ARKStepSetExplicit, libsundials_arkode), Cint, (ARKStepMemPtr,), arkode_mem)
end

function ARKStepSetImplicit(arkode_mem)
    ccall((:ARKStepSetImplicit, libsundials_arkode), Cint, (ARKStepMemPtr,), arkode_mem)
end

function ARKStepSetImEx(arkode_mem)
    ccall((:ARKStepSetImEx, libsundials_arkode), Cint, (ARKStepMemPtr,), arkode_mem)
end

function ARKStepSetTables(arkode_mem, q::Cint, p::Cint, Bi::ARKodeButcherTable, Be::ARKodeButcherTable)
    ccall((:ARKStepSetTables, libsundials_arkode), Cint, (ARKStepMemPtr, Cint, Cint, ARKodeButcherTable, ARKodeButcherTable), arkode_mem, q, p, Bi, Be)
end

function ARKStepSetTables(arkode_mem, q, p, Bi, Be)
    ARKStepSetTables(arkode_mem, convert(Cint, q), convert(Cint, p), Bi, Be)
end

function ARKStepSetTableNum(arkode_mem, itable::Cint, etable::Cint)
    ccall((:ARKStepSetTableNum, libsundials_arkode), Cint, (ARKStepMemPtr, Cint, Cint), arkode_mem, itable, etable)
end

function ARKStepSetTableNum(arkode_mem, itable, etable)
    ARKStepSetTableNum(arkode_mem, convert(Cint, itable), convert(Cint, etable))
end

function ARKStepSetCFLFraction(arkode_mem, cfl_frac::realtype)
    ccall((:ARKStepSetCFLFraction, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, cfl_frac)
end

function ARKStepSetSafetyFactor(arkode_mem, safety::realtype)
    ccall((:ARKStepSetSafetyFactor, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, safety)
end

function ARKStepSetErrorBias(arkode_mem, bias::realtype)
    ccall((:ARKStepSetErrorBias, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, bias)
end

function ARKStepSetMaxGrowth(arkode_mem, mx_growth::realtype)
    ccall((:ARKStepSetMaxGrowth, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, mx_growth)
end

function ARKStepSetFixedStepBounds(arkode_mem, lb::realtype, ub::realtype)
    ccall((:ARKStepSetFixedStepBounds, libsundials_arkode), Cint, (ARKStepMemPtr, realtype, realtype), arkode_mem, lb, ub)
end

function ARKStepSetAdaptivityMethod(arkode_mem, imethod::Cint, idefault::Cint, pq::Cint, adapt_params)
    ccall((:ARKStepSetAdaptivityMethod, libsundials_arkode), Cint, (ARKStepMemPtr, Cint, Cint, Cint, Ptr{realtype}), arkode_mem, imethod, idefault, pq, adapt_params)
end

function ARKStepSetAdaptivityMethod(arkode_mem, imethod, idefault, pq, adapt_params)
    ARKStepSetAdaptivityMethod(arkode_mem, convert(Cint, imethod), convert(Cint, idefault), convert(Cint, pq), adapt_params)
end

function ARKStepSetAdaptivityFn(arkode_mem, hfun::ARKAdaptFn, h_data)
    ccall((:ARKStepSetAdaptivityFn, libsundials_arkode), Cint, (ARKStepMemPtr, ARKAdaptFn, Ptr{Cvoid}), arkode_mem, hfun, h_data)
end

function ARKStepSetMaxFirstGrowth(arkode_mem, etamx1::realtype)
    ccall((:ARKStepSetMaxFirstGrowth, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, etamx1)
end

function ARKStepSetMaxEFailGrowth(arkode_mem, etamxf::realtype)
    ccall((:ARKStepSetMaxEFailGrowth, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, etamxf)
end

function ARKStepSetSmallNumEFails(arkode_mem, small_nef::Cint)
    ccall((:ARKStepSetSmallNumEFails, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, small_nef)
end

function ARKStepSetSmallNumEFails(arkode_mem, small_nef)
    ARKStepSetSmallNumEFails(arkode_mem, convert(Cint, small_nef))
end

function ARKStepSetMaxCFailGrowth(arkode_mem, etacf::realtype)
    ccall((:ARKStepSetMaxCFailGrowth, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, etacf)
end

function ARKStepSetNonlinCRDown(arkode_mem, crdown::realtype)
    ccall((:ARKStepSetNonlinCRDown, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, crdown)
end

function ARKStepSetNonlinRDiv(arkode_mem, rdiv::realtype)
    ccall((:ARKStepSetNonlinRDiv, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, rdiv)
end

function ARKStepSetDeltaGammaMax(arkode_mem, dgmax::realtype)
    ccall((:ARKStepSetDeltaGammaMax, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, dgmax)
end

function ARKStepSetMaxStepsBetweenLSet(arkode_mem, msbp::Cint)
    ccall((:ARKStepSetMaxStepsBetweenLSet, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, msbp)
end

function ARKStepSetMaxStepsBetweenLSet(arkode_mem, msbp)
    ARKStepSetMaxStepsBetweenLSet(arkode_mem, convert(Cint, msbp))
end

function ARKStepSetPredictorMethod(arkode_mem, method::Cint)
    ccall((:ARKStepSetPredictorMethod, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, method)
end

function ARKStepSetPredictorMethod(arkode_mem, method)
    ARKStepSetPredictorMethod(arkode_mem, convert(Cint, method))
end

function ARKStepSetStabilityFn(arkode_mem, EStab::ARKExpStabFn, estab_data)
    ccall((:ARKStepSetStabilityFn, libsundials_arkode), Cint, (ARKStepMemPtr, ARKExpStabFn, Ptr{Cvoid}), arkode_mem, EStab, estab_data)
end

function ARKStepSetMaxErrTestFails(arkode_mem, maxnef::Cint)
    ccall((:ARKStepSetMaxErrTestFails, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, maxnef)
end

function ARKStepSetMaxErrTestFails(arkode_mem, maxnef)
    ARKStepSetMaxErrTestFails(arkode_mem, convert(Cint, maxnef))
end

function ARKStepSetMaxNonlinIters(arkode_mem, maxcor::Cint)
    ccall((:ARKStepSetMaxNonlinIters, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, maxcor)
end

function ARKStepSetMaxNonlinIters(arkode_mem, maxcor)
    ARKStepSetMaxNonlinIters(arkode_mem, convert(Cint, maxcor))
end

function ARKStepSetMaxConvFails(arkode_mem, maxncf::Cint)
    ccall((:ARKStepSetMaxConvFails, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, maxncf)
end

function ARKStepSetMaxConvFails(arkode_mem, maxncf)
    ARKStepSetMaxConvFails(arkode_mem, convert(Cint, maxncf))
end

function ARKStepSetNonlinConvCoef(arkode_mem, nlscoef::realtype)
    ccall((:ARKStepSetNonlinConvCoef, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, nlscoef)
end

function ARKStepSetConstraints(arkode_mem, constraints::N_Vector)
    ccall((:ARKStepSetConstraints, libsundials_arkode), Cint, (ARKStepMemPtr, N_Vector), arkode_mem, constraints)
end

function ARKStepSetConstraints(arkode_mem, constraints)
    __constraints = convert(NVector, constraints)
    ARKStepSetConstraints(arkode_mem, convert(N_Vector, __constraints))
end

function ARKStepSetMaxNumSteps(arkode_mem, mxsteps::Clong)
    ccall((:ARKStepSetMaxNumSteps, libsundials_arkode), Cint, (ARKStepMemPtr, Clong), arkode_mem, mxsteps)
end

function ARKStepSetMaxNumSteps(arkode_mem, mxsteps)
    ARKStepSetMaxNumSteps(arkode_mem, convert(Clong, mxsteps))
end

function ARKStepSetMaxHnilWarns(arkode_mem, mxhnil::Cint)
    ccall((:ARKStepSetMaxHnilWarns, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, mxhnil)
end

function ARKStepSetMaxHnilWarns(arkode_mem, mxhnil)
    ARKStepSetMaxHnilWarns(arkode_mem, convert(Cint, mxhnil))
end

function ARKStepSetInitStep(arkode_mem, hin::realtype)
    ccall((:ARKStepSetInitStep, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, hin)
end

function ARKStepSetMinStep(arkode_mem, hmin::realtype)
    ccall((:ARKStepSetMinStep, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, hmin)
end

function ARKStepSetMaxStep(arkode_mem, hmax::realtype)
    ccall((:ARKStepSetMaxStep, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, hmax)
end

function ARKStepSetStopTime(arkode_mem, tstop::realtype)
    ccall((:ARKStepSetStopTime, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, tstop)
end

function ARKStepSetFixedStep(arkode_mem, hfixed::realtype)
    ccall((:ARKStepSetFixedStep, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, hfixed)
end

function ARKStepSetMaxNumConstrFails(arkode_mem, maxfails::Cint)
    ccall((:ARKStepSetMaxNumConstrFails, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, maxfails)
end

function ARKStepSetMaxNumConstrFails(arkode_mem, maxfails)
    ARKStepSetMaxNumConstrFails(arkode_mem, convert(Cint, maxfails))
end

function ARKStepSetRootDirection(arkode_mem, rootdir)
    ccall((:ARKStepSetRootDirection, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Cint}), arkode_mem, rootdir)
end

function ARKStepSetNoInactiveRootWarn(arkode_mem)
    ccall((:ARKStepSetNoInactiveRootWarn, libsundials_arkode), Cint, (ARKStepMemPtr,), arkode_mem)
end

function ARKStepSetErrHandlerFn(arkode_mem, ehfun::ARKErrHandlerFn, eh_data)
    ccall((:ARKStepSetErrHandlerFn, libsundials_arkode), Cint, (ARKStepMemPtr, ARKErrHandlerFn, Ptr{Cvoid}), arkode_mem, ehfun, eh_data)
end

function ARKStepSetErrFile(arkode_mem, errfp)
    ccall((:ARKStepSetErrFile, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Libc.FILE}), arkode_mem, errfp)
end

function ARKStepSetUserData(arkode_mem, user_data)
    ccall((:ARKStepSetUserData, libsundials_arkode), Cint, (ARKStepMemPtr, Any), arkode_mem, user_data)
end

function ARKStepSetDiagnostics(arkode_mem, diagfp)
    ccall((:ARKStepSetDiagnostics, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Libc.FILE}), arkode_mem, diagfp)
end

function ARKStepSetPostprocessStepFn(arkode_mem, ProcessStep::ARKPostProcessFn)
    ccall((:ARKStepSetPostprocessStepFn, libsundials_arkode), Cint, (ARKStepMemPtr, ARKPostProcessFn), arkode_mem, ProcessStep)
end

function ARKStepSetPostprocessStageFn(arkode_mem, ProcessStage::ARKPostProcessFn)
    ccall((:ARKStepSetPostprocessStageFn, libsundials_arkode), Cint, (ARKStepMemPtr, ARKPostProcessFn), arkode_mem, ProcessStage)
end

function ARKStepSetStagePredictFn(arkode_mem, PredictStage::ARKStepStagePredictFn)
    ccall((:ARKStepSetStagePredictFn, libsundials_arkode), Cint, (ARKStepMemPtr, ARKStepStagePredictFn), arkode_mem, PredictStage)
end

function ARKStepSetJacFn(arkode_mem, jac::ARKLsJacFn)
    ccall((:ARKStepSetJacFn, libsundials_arkode), Cint, (ARKStepMemPtr, ARKLsJacFn), arkode_mem, jac)
end

function ARKStepSetMassFn(arkode_mem, mass::ARKLsMassFn)
    ccall((:ARKStepSetMassFn, libsundials_arkode), Cint, (ARKStepMemPtr, ARKLsMassFn), arkode_mem, mass)
end

function ARKStepSetMaxStepsBetweenJac(arkode_mem, msbj::Clong)
    ccall((:ARKStepSetMaxStepsBetweenJac, libsundials_arkode), Cint, (ARKStepMemPtr, Clong), arkode_mem, msbj)
end

function ARKStepSetMaxStepsBetweenJac(arkode_mem, msbj)
    ARKStepSetMaxStepsBetweenJac(arkode_mem, convert(Clong, msbj))
end

function ARKStepSetLinearSolutionScaling(arkode_mem, onoff::Cint)
    ccall((:ARKStepSetLinearSolutionScaling, libsundials_arkode), Cint, (ARKStepMemPtr, Cint), arkode_mem, onoff)
end

function ARKStepSetLinearSolutionScaling(arkode_mem, onoff)
    ARKStepSetLinearSolutionScaling(arkode_mem, convert(Cint, onoff))
end

function ARKStepSetEpsLin(arkode_mem, eplifac::realtype)
    ccall((:ARKStepSetEpsLin, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, eplifac)
end

function ARKStepSetMassEpsLin(arkode_mem, eplifac::realtype)
    ccall((:ARKStepSetMassEpsLin, libsundials_arkode), Cint, (ARKStepMemPtr, realtype), arkode_mem, eplifac)
end

function ARKStepSetPreconditioner(arkode_mem, psetup::ARKLsPrecSetupFn, psolve::ARKLsPrecSolveFn)
    ccall((:ARKStepSetPreconditioner, libsundials_arkode), Cint, (ARKStepMemPtr, ARKLsPrecSetupFn, ARKLsPrecSolveFn), arkode_mem, psetup, psolve)
end

function ARKStepSetMassPreconditioner(arkode_mem, psetup::ARKLsMassPrecSetupFn, psolve::ARKLsMassPrecSolveFn)
    ccall((:ARKStepSetMassPreconditioner, libsundials_arkode), Cint, (ARKStepMemPtr, ARKLsMassPrecSetupFn, ARKLsMassPrecSolveFn), arkode_mem, psetup, psolve)
end

function ARKStepSetJacTimes(arkode_mem, jtsetup::ARKLsJacTimesSetupFn, jtimes::ARKLsJacTimesVecFn)
    ccall((:ARKStepSetJacTimes, libsundials_arkode), Cint, (ARKStepMemPtr, ARKLsJacTimesSetupFn, ARKLsJacTimesVecFn), arkode_mem, jtsetup, jtimes)
end

function ARKStepSetMassTimes(arkode_mem, msetup::ARKLsMassTimesSetupFn, mtimes::ARKLsMassTimesVecFn, mtimes_data)
    ccall((:ARKStepSetMassTimes, libsundials_arkode), Cint, (ARKStepMemPtr, ARKLsMassTimesSetupFn, ARKLsMassTimesVecFn, Ptr{Cvoid}), arkode_mem, msetup, mtimes, mtimes_data)
end

function ARKStepSetLinSysFn(arkode_mem, linsys::ARKLsLinSysFn)
    ccall((:ARKStepSetLinSysFn, libsundials_arkode), Cint, (ARKStepMemPtr, ARKLsLinSysFn), arkode_mem, linsys)
end

function ARKStepEvolve(arkode_mem, tout::realtype, yout::N_Vector, tret, itask::Cint)
    ccall((:ARKStepEvolve, libsundials_arkode), Cint, (ARKStepMemPtr, realtype, N_Vector, Ptr{realtype}, Cint), arkode_mem, tout, yout, tret, itask)
end

function ARKStepEvolve(arkode_mem, tout, yout, tret, itask)
    __yout = convert(NVector, yout)
    ARKStepEvolve(arkode_mem, tout, convert(N_Vector, __yout), tret, convert(Cint, itask))
end

function ARKStepGetDky(arkode_mem, t::realtype, k::Cint, dky::N_Vector)
    ccall((:ARKStepGetDky, libsundials_arkode), Cint, (ARKStepMemPtr, realtype, Cint, N_Vector), arkode_mem, t, k, dky)
end

function ARKStepGetDky(arkode_mem, t, k, dky)
    __dky = convert(NVector, dky)
    ARKStepGetDky(arkode_mem, t, convert(Cint, k), convert(N_Vector, __dky))
end

function ARKStepGetNumExpSteps(arkode_mem, expsteps)
    ccall((:ARKStepGetNumExpSteps, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, expsteps)
end

function ARKStepGetNumAccSteps(arkode_mem, accsteps)
    ccall((:ARKStepGetNumAccSteps, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, accsteps)
end

function ARKStepGetNumStepAttempts(arkode_mem, step_attempts)
    ccall((:ARKStepGetNumStepAttempts, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, step_attempts)
end

function ARKStepGetNumRhsEvals(arkode_mem, nfe_evals, nfi_evals)
    ccall((:ARKStepGetNumRhsEvals, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}, Ptr{Clong}), arkode_mem, nfe_evals, nfi_evals)
end

function ARKStepGetNumLinSolvSetups(arkode_mem, nlinsetups)
    ccall((:ARKStepGetNumLinSolvSetups, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nlinsetups)
end

function ARKStepGetNumErrTestFails(arkode_mem, netfails)
    ccall((:ARKStepGetNumErrTestFails, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, netfails)
end

function ARKStepGetCurrentButcherTables(arkode_mem, Bi, Be)
    ccall((:ARKStepGetCurrentButcherTables, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{ARKodeButcherTable}, Ptr{ARKodeButcherTable}), arkode_mem, Bi, Be)
end

function ARKStepGetEstLocalErrors(arkode_mem, ele::N_Vector)
    ccall((:ARKStepGetEstLocalErrors, libsundials_arkode), Cint, (ARKStepMemPtr, N_Vector), arkode_mem, ele)
end

function ARKStepGetEstLocalErrors(arkode_mem, ele)
    __ele = convert(NVector, ele)
    ARKStepGetEstLocalErrors(arkode_mem, convert(N_Vector, __ele))
end

function ARKStepGetWorkSpace(arkode_mem, lenrw, leniw)
    ccall((:ARKStepGetWorkSpace, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}, Ptr{Clong}), arkode_mem, lenrw, leniw)
end

function ARKStepGetNumSteps(arkode_mem, nsteps)
    ccall((:ARKStepGetNumSteps, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nsteps)
end

function ARKStepGetActualInitStep(arkode_mem, hinused)
    ccall((:ARKStepGetActualInitStep, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{realtype}), arkode_mem, hinused)
end

function ARKStepGetLastStep(arkode_mem, hlast)
    ccall((:ARKStepGetLastStep, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{realtype}), arkode_mem, hlast)
end

function ARKStepGetCurrentStep(arkode_mem, hcur)
    ccall((:ARKStepGetCurrentStep, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{realtype}), arkode_mem, hcur)
end

function ARKStepGetCurrentTime(arkode_mem, tcur)
    ccall((:ARKStepGetCurrentTime, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{realtype}), arkode_mem, tcur)
end

function ARKStepGetCurrentState(arkode_mem, ycur)
    ccall((:ARKStepGetCurrentState, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{N_Vector}), arkode_mem, ycur)
end

function ARKStepGetCurrentGamma(arkode_mem, gamma)
    ccall((:ARKStepGetCurrentGamma, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{realtype}), arkode_mem, gamma)
end

function ARKStepGetTolScaleFactor(arkode_mem, tolsfac)
    ccall((:ARKStepGetTolScaleFactor, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{realtype}), arkode_mem, tolsfac)
end

function ARKStepGetErrWeights(arkode_mem, eweight::N_Vector)
    ccall((:ARKStepGetErrWeights, libsundials_arkode), Cint, (ARKStepMemPtr, N_Vector), arkode_mem, eweight)
end

function ARKStepGetErrWeights(arkode_mem, eweight)
    __eweight = convert(NVector, eweight)
    ARKStepGetErrWeights(arkode_mem, convert(N_Vector, __eweight))
end

function ARKStepGetResWeights(arkode_mem, rweight::N_Vector)
    ccall((:ARKStepGetResWeights, libsundials_arkode), Cint, (ARKStepMemPtr, N_Vector), arkode_mem, rweight)
end

function ARKStepGetResWeights(arkode_mem, rweight)
    __rweight = convert(NVector, rweight)
    ARKStepGetResWeights(arkode_mem, convert(N_Vector, __rweight))
end

function ARKStepGetNumGEvals(arkode_mem, ngevals)
    ccall((:ARKStepGetNumGEvals, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, ngevals)
end

function ARKStepGetRootInfo(arkode_mem, rootsfound)
    ccall((:ARKStepGetRootInfo, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Cint}), arkode_mem, rootsfound)
end

function ARKStepGetNumConstrFails(arkode_mem, nconstrfails)
    ccall((:ARKStepGetNumConstrFails, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nconstrfails)
end

function ARKStepGetReturnFlagName(flag::Clong)
    ccall((:ARKStepGetReturnFlagName, libsundials_arkode), Cstring, (Clong,), flag)
end

function ARKStepGetReturnFlagName(flag)
    ARKStepGetReturnFlagName(convert(Clong, flag))
end

function ARKStepWriteParameters(arkode_mem, fp)
    ccall((:ARKStepWriteParameters, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Libc.FILE}), arkode_mem, fp)
end

function ARKStepWriteButcher(arkode_mem, fp)
    ccall((:ARKStepWriteButcher, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Libc.FILE}), arkode_mem, fp)
end

function ARKStepGetTimestepperStats(arkode_mem, expsteps, accsteps, step_attempts, nfe_evals, nfi_evals, nlinsetups, netfails)
    ccall((:ARKStepGetTimestepperStats, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}), arkode_mem, expsteps, accsteps, step_attempts, nfe_evals, nfi_evals, nlinsetups, netfails)
end

function ARKStepGetStepStats(arkode_mem, nsteps, hinused, hlast, hcur, tcur)
    ccall((:ARKStepGetStepStats, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}), arkode_mem, nsteps, hinused, hlast, hcur, tcur)
end

function ARKStepGetNumNonlinSolvIters(arkode_mem, nniters)
    ccall((:ARKStepGetNumNonlinSolvIters, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nniters)
end

function ARKStepGetNumNonlinSolvConvFails(arkode_mem, nncfails)
    ccall((:ARKStepGetNumNonlinSolvConvFails, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nncfails)
end

function ARKStepGetNonlinSolvStats(arkode_mem, nniters, nncfails)
    ccall((:ARKStepGetNonlinSolvStats, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}, Ptr{Clong}), arkode_mem, nniters, nncfails)
end

function ARKStepGetLinWorkSpace(arkode_mem, lenrwLS, leniwLS)
    ccall((:ARKStepGetLinWorkSpace, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}, Ptr{Clong}), arkode_mem, lenrwLS, leniwLS)
end

function ARKStepGetNumJacEvals(arkode_mem, njevals)
    ccall((:ARKStepGetNumJacEvals, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, njevals)
end

function ARKStepGetNumPrecEvals(arkode_mem, npevals)
    ccall((:ARKStepGetNumPrecEvals, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, npevals)
end

function ARKStepGetNumPrecSolves(arkode_mem, npsolves)
    ccall((:ARKStepGetNumPrecSolves, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, npsolves)
end

function ARKStepGetNumLinIters(arkode_mem, nliters)
    ccall((:ARKStepGetNumLinIters, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nliters)
end

function ARKStepGetNumLinConvFails(arkode_mem, nlcfails)
    ccall((:ARKStepGetNumLinConvFails, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nlcfails)
end

function ARKStepGetNumJTSetupEvals(arkode_mem, njtsetups)
    ccall((:ARKStepGetNumJTSetupEvals, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, njtsetups)
end

function ARKStepGetNumJtimesEvals(arkode_mem, njvevals)
    ccall((:ARKStepGetNumJtimesEvals, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, njvevals)
end

function ARKStepGetNumLinRhsEvals(arkode_mem, nfevalsLS)
    ccall((:ARKStepGetNumLinRhsEvals, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nfevalsLS)
end

function ARKStepGetLastLinFlag(arkode_mem, flag)
    ccall((:ARKStepGetLastLinFlag, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, flag)
end

function ARKStepGetMassWorkSpace(arkode_mem, lenrwMLS, leniwMLS)
    ccall((:ARKStepGetMassWorkSpace, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}, Ptr{Clong}), arkode_mem, lenrwMLS, leniwMLS)
end

function ARKStepGetNumMassSetups(arkode_mem, nmsetups)
    ccall((:ARKStepGetNumMassSetups, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nmsetups)
end

function ARKStepGetNumMassMultSetups(arkode_mem, nmvsetups)
    ccall((:ARKStepGetNumMassMultSetups, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nmvsetups)
end

function ARKStepGetNumMassMult(arkode_mem, nmvevals)
    ccall((:ARKStepGetNumMassMult, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nmvevals)
end

function ARKStepGetNumMassSolves(arkode_mem, nmsolves)
    ccall((:ARKStepGetNumMassSolves, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nmsolves)
end

function ARKStepGetNumMassPrecEvals(arkode_mem, nmpevals)
    ccall((:ARKStepGetNumMassPrecEvals, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nmpevals)
end

function ARKStepGetNumMassPrecSolves(arkode_mem, nmpsolves)
    ccall((:ARKStepGetNumMassPrecSolves, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nmpsolves)
end

function ARKStepGetNumMassIters(arkode_mem, nmiters)
    ccall((:ARKStepGetNumMassIters, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nmiters)
end

function ARKStepGetNumMassConvFails(arkode_mem, nmcfails)
    ccall((:ARKStepGetNumMassConvFails, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nmcfails)
end

function ARKStepGetNumMTSetups(arkode_mem, nmtsetups)
    ccall((:ARKStepGetNumMTSetups, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nmtsetups)
end

function ARKStepGetLastMassFlag(arkode_mem, flag)
    ccall((:ARKStepGetLastMassFlag, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, flag)
end

function ARKStepGetLinReturnFlagName(flag::Clong)
    ccall((:ARKStepGetLinReturnFlagName, libsundials_arkode), Cstring, (Clong,), flag)
end

function ARKStepGetLinReturnFlagName(flag)
    ARKStepGetLinReturnFlagName(convert(Clong, flag))
end

function ARKStepFree(arkode_mem)
    ccall((:ARKStepFree, libsundials_arkode), Cvoid, (Ref{ARKStepMemPtr},), arkode_mem)
end

function ARKStepPrintMem(arkode_mem, outfile)
    ccall((:ARKStepPrintMem, libsundials_arkode), Cvoid, (ARKStepMemPtr, Ptr{Libc.FILE}), arkode_mem, outfile)
end

function ARKBandPrecInit(arkode_mem, N::sunindextype, mu::sunindextype, ml::sunindextype)
    ccall((:ARKBandPrecInit, libsundials_arkode), Cint, (ARKStepMemPtr, sunindextype, sunindextype, sunindextype), arkode_mem, N, mu, ml)
end

function ARKBandPrecGetWorkSpace(arkode_mem, lenrwLS, leniwLS)
    ccall((:ARKBandPrecGetWorkSpace, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}, Ptr{Clong}), arkode_mem, lenrwLS, leniwLS)
end

function ARKBandPrecGetNumRhsEvals(arkode_mem, nfevalsBP)
    ccall((:ARKBandPrecGetNumRhsEvals, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, nfevalsBP)
end

function ARKBBDPrecInit(arkode_mem, Nlocal::sunindextype, mudq::sunindextype, mldq::sunindextype, mukeep::sunindextype, mlkeep::sunindextype, dqrely::realtype, gloc::ARKLocalFn, cfn::ARKCommFn)
    ccall((:ARKBBDPrecInit, libsundials_arkode), Cint, (ARKStepMemPtr, sunindextype, sunindextype, sunindextype, sunindextype, sunindextype, realtype, ARKLocalFn, ARKCommFn), arkode_mem, Nlocal, mudq, mldq, mukeep, mlkeep, dqrely, gloc, cfn)
end

function ARKBBDPrecReInit(arkode_mem, mudq::sunindextype, mldq::sunindextype, dqrely::realtype)
    ccall((:ARKBBDPrecReInit, libsundials_arkode), Cint, (ARKStepMemPtr, sunindextype, sunindextype, realtype), arkode_mem, mudq, mldq, dqrely)
end

function ARKBBDPrecGetWorkSpace(arkode_mem, lenrwBBDP, leniwBBDP)
    ccall((:ARKBBDPrecGetWorkSpace, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}, Ptr{Clong}), arkode_mem, lenrwBBDP, leniwBBDP)
end

function ARKBBDPrecGetNumGfnEvals(arkode_mem, ngevalsBBDP)
    ccall((:ARKBBDPrecGetNumGfnEvals, libsundials_arkode), Cint, (ARKStepMemPtr, Ptr{Clong}), arkode_mem, ngevalsBBDP)
end

function ARKodeButcherTable_Alloc(stages::Cint, embedded::Cint)
    ccall((:ARKodeButcherTable_Alloc, libsundials_arkode), ARKodeButcherTable, (Cint, Cint), stages, embedded)
end

function ARKodeButcherTable_Alloc(stages, embedded)
    ARKodeButcherTable_Alloc(convert(Cint, stages), convert(Cint, embedded))
end

function ARKodeButcherTable_Create(s::Cint, q::Cint, p::Cint, c, A, b, d)
    ccall((:ARKodeButcherTable_Create, libsundials_arkode), ARKodeButcherTable, (Cint, Cint, Cint, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}), s, q, p, c, A, b, d)
end

function ARKodeButcherTable_Create(s, q, p, c, A, b, d)
    ARKodeButcherTable_Create(convert(Cint, s), convert(Cint, q), convert(Cint, p), c, A, b, d)
end

function ARKodeButcherTable_Copy(B::ARKodeButcherTable)
    ccall((:ARKodeButcherTable_Copy, libsundials_arkode), ARKodeButcherTable, (ARKodeButcherTable,), B)
end

function ARKodeButcherTable_Space(B::ARKodeButcherTable, liw, lrw)
    ccall((:ARKodeButcherTable_Space, libsundials_arkode), Cvoid, (ARKodeButcherTable, Ptr{sunindextype}, Ptr{sunindextype}), B, liw, lrw)
end

function ARKodeButcherTable_Free(B::ARKodeButcherTable)
    ccall((:ARKodeButcherTable_Free, libsundials_arkode), Cvoid, (ARKodeButcherTable,), B)
end

function ARKodeButcherTable_Write(B::ARKodeButcherTable, outfile)
    ccall((:ARKodeButcherTable_Write, libsundials_arkode), Cvoid, (ARKodeButcherTable, Ptr{Cint}), B, outfile)
end

function ARKodeButcherTable_CheckOrder(B::ARKodeButcherTable, q, p, outfile)
    ccall((:ARKodeButcherTable_CheckOrder, libsundials_arkode), Cint, (ARKodeButcherTable, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), B, q, p, outfile)
end

function ARKodeButcherTable_CheckARKOrder(B1::ARKodeButcherTable, B2::ARKodeButcherTable, q, p, outfile)
    ccall((:ARKodeButcherTable_CheckARKOrder, libsundials_arkode), Cint, (ARKodeButcherTable, ARKodeButcherTable, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), B1, B2, q, p, outfile)
end

function ARKodeButcherTable_LoadDIRK(imethod::Cint)
    ccall((:ARKodeButcherTable_LoadDIRK, libsundials_arkode), ARKodeButcherTable, (Cint,), imethod)
end

function ARKodeButcherTable_LoadDIRK(imethod)
    ARKodeButcherTable_LoadDIRK(convert(Cint, imethod))
end

function ARKodeButcherTable_LoadERK(imethod::Cint)
    ccall((:ARKodeButcherTable_LoadERK, libsundials_arkode), ARKodeButcherTable, (Cint,), imethod)
end

function ARKodeButcherTable_LoadERK(imethod)
    ARKodeButcherTable_LoadERK(convert(Cint, imethod))
end

function ERKStepCreate(f::ARKRhsFn, t0::realtype, y0::N_Vector)
    ccall((:ERKStepCreate, libsundials_arkode), ERKStepMemPtr, (ARKRhsFn, realtype, N_Vector), f, t0, y0)
end

function ERKStepCreate(f, t0, y0)
    __y0 = convert(NVector, y0)
    ERKStepCreate(ARKRhsFn_wrapper(f), t0, convert(N_Vector, __y0))
end

function ERKStepResize(arkode_mem, ynew::N_Vector, hscale::realtype, t0::realtype, resize::ARKVecResizeFn, resize_data)
    ccall((:ERKStepResize, libsundials_arkode), Cint, (ERKStepMemPtr, N_Vector, realtype, realtype, ARKVecResizeFn, Ptr{Cvoid}), arkode_mem, ynew, hscale, t0, resize, resize_data)
end

function ERKStepResize(arkode_mem, ynew, hscale, t0, resize, resize_data)
    __ynew = convert(NVector, ynew)
    ERKStepResize(arkode_mem, convert(N_Vector, __ynew), hscale, t0, resize, resize_data)
end

function ERKStepReInit(arkode_mem, f::ARKRhsFn, t0::realtype, y0::N_Vector)
    ccall((:ERKStepReInit, libsundials_arkode), Cint, (ERKStepMemPtr, ARKRhsFn, realtype, N_Vector), arkode_mem, f, t0, y0)
end

function ERKStepReInit(arkode_mem, f, t0, y0)
    __y0 = convert(NVector, y0)
    ERKStepReInit(arkode_mem, ARKRhsFn_wrapper(f), t0, convert(N_Vector, __y0))
end

function ERKStepSStolerances(arkode_mem, reltol::realtype, abstol::realtype)
    ccall((:ERKStepSStolerances, libsundials_arkode), Cint, (ERKStepMemPtr, realtype, realtype), arkode_mem, reltol, abstol)
end

function ERKStepSVtolerances(arkode_mem, reltol::realtype, abstol::N_Vector)
    ccall((:ERKStepSVtolerances, libsundials_arkode), Cint, (ERKStepMemPtr, realtype, N_Vector), arkode_mem, reltol, abstol)
end

function ERKStepSVtolerances(arkode_mem, reltol, abstol)
    __abstol = convert(NVector, abstol)
    ERKStepSVtolerances(arkode_mem, reltol, convert(N_Vector, __abstol))
end

function ERKStepWFtolerances(arkode_mem, efun::ARKEwtFn)
    ccall((:ERKStepWFtolerances, libsundials_arkode), Cint, (ERKStepMemPtr, ARKEwtFn), arkode_mem, efun)
end

function ERKStepRootInit(arkode_mem, nrtfn::Cint, g::ARKRootFn)
    ccall((:ERKStepRootInit, libsundials_arkode), Cint, (ERKStepMemPtr, Cint, ARKRootFn), arkode_mem, nrtfn, g)
end

function ERKStepRootInit(arkode_mem, nrtfn, g)
    ERKStepRootInit(arkode_mem, convert(Cint, nrtfn), g)
end

function ERKStepSetDefaults(arkode_mem)
    ccall((:ERKStepSetDefaults, libsundials_arkode), Cint, (ERKStepMemPtr,), arkode_mem)
end

function ERKStepSetOrder(arkode_mem, maxord::Cint)
    ccall((:ERKStepSetOrder, libsundials_arkode), Cint, (ERKStepMemPtr, Cint), arkode_mem, maxord)
end

function ERKStepSetOrder(arkode_mem, maxord)
    ERKStepSetOrder(arkode_mem, convert(Cint, maxord))
end

function ERKStepSetInterpolantType(arkode_mem, itype::Cint)
    ccall((:ERKStepSetInterpolantType, libsundials_arkode), Cint, (ERKStepMemPtr, Cint), arkode_mem, itype)
end

function ERKStepSetInterpolantType(arkode_mem, itype)
    ERKStepSetInterpolantType(arkode_mem, convert(Cint, itype))
end

function ERKStepSetInterpolantDegree(arkode_mem, degree::Cint)
    ccall((:ERKStepSetInterpolantDegree, libsundials_arkode), Cint, (ERKStepMemPtr, Cint), arkode_mem, degree)
end

function ERKStepSetInterpolantDegree(arkode_mem, degree)
    ERKStepSetInterpolantDegree(arkode_mem, convert(Cint, degree))
end

function ERKStepSetDenseOrder(arkode_mem, dord::Cint)
    ccall((:ERKStepSetDenseOrder, libsundials_arkode), Cint, (ERKStepMemPtr, Cint), arkode_mem, dord)
end

function ERKStepSetDenseOrder(arkode_mem, dord)
    ERKStepSetDenseOrder(arkode_mem, convert(Cint, dord))
end

function ERKStepSetTable(arkode_mem, B::ARKodeButcherTable)
    ccall((:ERKStepSetTable, libsundials_arkode), Cint, (ERKStepMemPtr, ARKodeButcherTable), arkode_mem, B)
end

function ERKStepSetTableNum(arkode_mem, itable::Cint)
    ccall((:ERKStepSetTableNum, libsundials_arkode), Cint, (ERKStepMemPtr, Cint), arkode_mem, itable)
end

function ERKStepSetTableNum(arkode_mem, itable)
    ERKStepSetTableNum(arkode_mem, convert(Cint, itable))
end

function ERKStepSetCFLFraction(arkode_mem, cfl_frac::realtype)
    ccall((:ERKStepSetCFLFraction, libsundials_arkode), Cint, (ERKStepMemPtr, realtype), arkode_mem, cfl_frac)
end

function ERKStepSetSafetyFactor(arkode_mem, safety::realtype)
    ccall((:ERKStepSetSafetyFactor, libsundials_arkode), Cint, (ERKStepMemPtr, realtype), arkode_mem, safety)
end

function ERKStepSetErrorBias(arkode_mem, bias::realtype)
    ccall((:ERKStepSetErrorBias, libsundials_arkode), Cint, (ERKStepMemPtr, realtype), arkode_mem, bias)
end

function ERKStepSetMaxGrowth(arkode_mem, mx_growth::realtype)
    ccall((:ERKStepSetMaxGrowth, libsundials_arkode), Cint, (ERKStepMemPtr, realtype), arkode_mem, mx_growth)
end

function ERKStepSetFixedStepBounds(arkode_mem, lb::realtype, ub::realtype)
    ccall((:ERKStepSetFixedStepBounds, libsundials_arkode), Cint, (ERKStepMemPtr, realtype, realtype), arkode_mem, lb, ub)
end

function ERKStepSetAdaptivityMethod(arkode_mem, imethod::Cint, idefault::Cint, pq::Cint, adapt_params)
    ccall((:ERKStepSetAdaptivityMethod, libsundials_arkode), Cint, (ERKStepMemPtr, Cint, Cint, Cint, Ptr{realtype}), arkode_mem, imethod, idefault, pq, adapt_params)
end

function ERKStepSetAdaptivityMethod(arkode_mem, imethod, idefault, pq, adapt_params)
    ERKStepSetAdaptivityMethod(arkode_mem, convert(Cint, imethod), convert(Cint, idefault), convert(Cint, pq), adapt_params)
end

function ERKStepSetAdaptivityFn(arkode_mem, hfun::ARKAdaptFn, h_data)
    ccall((:ERKStepSetAdaptivityFn, libsundials_arkode), Cint, (ERKStepMemPtr, ARKAdaptFn, Ptr{Cvoid}), arkode_mem, hfun, h_data)
end

function ERKStepSetMaxFirstGrowth(arkode_mem, etamx1::realtype)
    ccall((:ERKStepSetMaxFirstGrowth, libsundials_arkode), Cint, (ERKStepMemPtr, realtype), arkode_mem, etamx1)
end

function ERKStepSetMaxEFailGrowth(arkode_mem, etamxf::realtype)
    ccall((:ERKStepSetMaxEFailGrowth, libsundials_arkode), Cint, (ERKStepMemPtr, realtype), arkode_mem, etamxf)
end

function ERKStepSetSmallNumEFails(arkode_mem, small_nef::Cint)
    ccall((:ERKStepSetSmallNumEFails, libsundials_arkode), Cint, (ERKStepMemPtr, Cint), arkode_mem, small_nef)
end

function ERKStepSetSmallNumEFails(arkode_mem, small_nef)
    ERKStepSetSmallNumEFails(arkode_mem, convert(Cint, small_nef))
end

function ERKStepSetStabilityFn(arkode_mem, EStab::ARKExpStabFn, estab_data)
    ccall((:ERKStepSetStabilityFn, libsundials_arkode), Cint, (ERKStepMemPtr, ARKExpStabFn, Ptr{Cvoid}), arkode_mem, EStab, estab_data)
end

function ERKStepSetMaxErrTestFails(arkode_mem, maxnef::Cint)
    ccall((:ERKStepSetMaxErrTestFails, libsundials_arkode), Cint, (ERKStepMemPtr, Cint), arkode_mem, maxnef)
end

function ERKStepSetMaxErrTestFails(arkode_mem, maxnef)
    ERKStepSetMaxErrTestFails(arkode_mem, convert(Cint, maxnef))
end

function ERKStepSetConstraints(arkode_mem, constraints::N_Vector)
    ccall((:ERKStepSetConstraints, libsundials_arkode), Cint, (ERKStepMemPtr, N_Vector), arkode_mem, constraints)
end

function ERKStepSetConstraints(arkode_mem, constraints)
    __constraints = convert(NVector, constraints)
    ERKStepSetConstraints(arkode_mem, convert(N_Vector, __constraints))
end

function ERKStepSetMaxNumSteps(arkode_mem, mxsteps::Clong)
    ccall((:ERKStepSetMaxNumSteps, libsundials_arkode), Cint, (ERKStepMemPtr, Clong), arkode_mem, mxsteps)
end

function ERKStepSetMaxNumSteps(arkode_mem, mxsteps)
    ERKStepSetMaxNumSteps(arkode_mem, convert(Clong, mxsteps))
end

function ERKStepSetMaxHnilWarns(arkode_mem, mxhnil::Cint)
    ccall((:ERKStepSetMaxHnilWarns, libsundials_arkode), Cint, (ERKStepMemPtr, Cint), arkode_mem, mxhnil)
end

function ERKStepSetMaxHnilWarns(arkode_mem, mxhnil)
    ERKStepSetMaxHnilWarns(arkode_mem, convert(Cint, mxhnil))
end

function ERKStepSetInitStep(arkode_mem, hin::realtype)
    ccall((:ERKStepSetInitStep, libsundials_arkode), Cint, (ERKStepMemPtr, realtype), arkode_mem, hin)
end

function ERKStepSetMinStep(arkode_mem, hmin::realtype)
    ccall((:ERKStepSetMinStep, libsundials_arkode), Cint, (ERKStepMemPtr, realtype), arkode_mem, hmin)
end

function ERKStepSetMaxStep(arkode_mem, hmax::realtype)
    ccall((:ERKStepSetMaxStep, libsundials_arkode), Cint, (ERKStepMemPtr, realtype), arkode_mem, hmax)
end

function ERKStepSetStopTime(arkode_mem, tstop::realtype)
    ccall((:ERKStepSetStopTime, libsundials_arkode), Cint, (ERKStepMemPtr, realtype), arkode_mem, tstop)
end

function ERKStepSetFixedStep(arkode_mem, hfixed::realtype)
    ccall((:ERKStepSetFixedStep, libsundials_arkode), Cint, (ERKStepMemPtr, realtype), arkode_mem, hfixed)
end

function ERKStepSetMaxNumConstrFails(arkode_mem, maxfails::Cint)
    ccall((:ERKStepSetMaxNumConstrFails, libsundials_arkode), Cint, (ERKStepMemPtr, Cint), arkode_mem, maxfails)
end

function ERKStepSetMaxNumConstrFails(arkode_mem, maxfails)
    ERKStepSetMaxNumConstrFails(arkode_mem, convert(Cint, maxfails))
end

function ERKStepSetRootDirection(arkode_mem, rootdir)
    ccall((:ERKStepSetRootDirection, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Cint}), arkode_mem, rootdir)
end

function ERKStepSetNoInactiveRootWarn(arkode_mem)
    ccall((:ERKStepSetNoInactiveRootWarn, libsundials_arkode), Cint, (ERKStepMemPtr,), arkode_mem)
end

function ERKStepSetErrHandlerFn(arkode_mem, ehfun::ARKErrHandlerFn, eh_data)
    ccall((:ERKStepSetErrHandlerFn, libsundials_arkode), Cint, (ERKStepMemPtr, ARKErrHandlerFn, Ptr{Cvoid}), arkode_mem, ehfun, eh_data)
end

function ERKStepSetErrFile(arkode_mem, errfp)
    ccall((:ERKStepSetErrFile, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Libc.FILE}), arkode_mem, errfp)
end

function ERKStepSetUserData(arkode_mem, user_data)
    ccall((:ERKStepSetUserData, libsundials_arkode), Cint, (ERKStepMemPtr, Any), arkode_mem, user_data)
end

function ERKStepSetDiagnostics(arkode_mem, diagfp)
    ccall((:ERKStepSetDiagnostics, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Libc.FILE}), arkode_mem, diagfp)
end

function ERKStepSetPostprocessStepFn(arkode_mem, ProcessStep::ARKPostProcessFn)
    ccall((:ERKStepSetPostprocessStepFn, libsundials_arkode), Cint, (ERKStepMemPtr, ARKPostProcessFn), arkode_mem, ProcessStep)
end

function ERKStepSetPostprocessStageFn(arkode_mem, ProcessStage::ARKPostProcessFn)
    ccall((:ERKStepSetPostprocessStageFn, libsundials_arkode), Cint, (ERKStepMemPtr, ARKPostProcessFn), arkode_mem, ProcessStage)
end

function ERKStepEvolve(arkode_mem, tout::realtype, yout::N_Vector, tret, itask::Cint)
    ccall((:ERKStepEvolve, libsundials_arkode), Cint, (ERKStepMemPtr, realtype, N_Vector, Ptr{realtype}, Cint), arkode_mem, tout, yout, tret, itask)
end

function ERKStepEvolve(arkode_mem, tout, yout, tret, itask)
    __yout = convert(NVector, yout)
    ERKStepEvolve(arkode_mem, tout, convert(N_Vector, __yout), tret, convert(Cint, itask))
end

function ERKStepGetDky(arkode_mem, t::realtype, k::Cint, dky::N_Vector)
    ccall((:ERKStepGetDky, libsundials_arkode), Cint, (ERKStepMemPtr, realtype, Cint, N_Vector), arkode_mem, t, k, dky)
end

function ERKStepGetDky(arkode_mem, t, k, dky)
    __dky = convert(NVector, dky)
    ERKStepGetDky(arkode_mem, t, convert(Cint, k), convert(N_Vector, __dky))
end

function ERKStepGetNumExpSteps(arkode_mem, expsteps)
    ccall((:ERKStepGetNumExpSteps, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Clong}), arkode_mem, expsteps)
end

function ERKStepGetNumAccSteps(arkode_mem, accsteps)
    ccall((:ERKStepGetNumAccSteps, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Clong}), arkode_mem, accsteps)
end

function ERKStepGetNumStepAttempts(arkode_mem, step_attempts)
    ccall((:ERKStepGetNumStepAttempts, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Clong}), arkode_mem, step_attempts)
end

function ERKStepGetNumRhsEvals(arkode_mem, nfevals)
    ccall((:ERKStepGetNumRhsEvals, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Clong}), arkode_mem, nfevals)
end

function ERKStepGetNumErrTestFails(arkode_mem, netfails)
    ccall((:ERKStepGetNumErrTestFails, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Clong}), arkode_mem, netfails)
end

function ERKStepGetCurrentButcherTable(arkode_mem, B)
    ccall((:ERKStepGetCurrentButcherTable, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{ARKodeButcherTable}), arkode_mem, B)
end

function ERKStepGetEstLocalErrors(arkode_mem, ele::N_Vector)
    ccall((:ERKStepGetEstLocalErrors, libsundials_arkode), Cint, (ERKStepMemPtr, N_Vector), arkode_mem, ele)
end

function ERKStepGetEstLocalErrors(arkode_mem, ele)
    __ele = convert(NVector, ele)
    ERKStepGetEstLocalErrors(arkode_mem, convert(N_Vector, __ele))
end

function ERKStepGetWorkSpace(arkode_mem, lenrw, leniw)
    ccall((:ERKStepGetWorkSpace, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Clong}, Ptr{Clong}), arkode_mem, lenrw, leniw)
end

function ERKStepGetNumSteps(arkode_mem, nsteps)
    ccall((:ERKStepGetNumSteps, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Clong}), arkode_mem, nsteps)
end

function ERKStepGetActualInitStep(arkode_mem, hinused)
    ccall((:ERKStepGetActualInitStep, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{realtype}), arkode_mem, hinused)
end

function ERKStepGetLastStep(arkode_mem, hlast)
    ccall((:ERKStepGetLastStep, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{realtype}), arkode_mem, hlast)
end

function ERKStepGetCurrentStep(arkode_mem, hcur)
    ccall((:ERKStepGetCurrentStep, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{realtype}), arkode_mem, hcur)
end

function ERKStepGetCurrentTime(arkode_mem, tcur)
    ccall((:ERKStepGetCurrentTime, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{realtype}), arkode_mem, tcur)
end

function ERKStepGetTolScaleFactor(arkode_mem, tolsfac)
    ccall((:ERKStepGetTolScaleFactor, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{realtype}), arkode_mem, tolsfac)
end

function ERKStepGetErrWeights(arkode_mem, eweight::N_Vector)
    ccall((:ERKStepGetErrWeights, libsundials_arkode), Cint, (ERKStepMemPtr, N_Vector), arkode_mem, eweight)
end

function ERKStepGetErrWeights(arkode_mem, eweight)
    __eweight = convert(NVector, eweight)
    ERKStepGetErrWeights(arkode_mem, convert(N_Vector, __eweight))
end

function ERKStepGetNumGEvals(arkode_mem, ngevals)
    ccall((:ERKStepGetNumGEvals, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Clong}), arkode_mem, ngevals)
end

function ERKStepGetRootInfo(arkode_mem, rootsfound)
    ccall((:ERKStepGetRootInfo, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Cint}), arkode_mem, rootsfound)
end

function ERKStepGetNumConstrFails(arkode_mem, nconstrfails)
    ccall((:ERKStepGetNumConstrFails, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Clong}), arkode_mem, nconstrfails)
end

function ERKStepGetReturnFlagName(flag::Clong)
    ccall((:ERKStepGetReturnFlagName, libsundials_arkode), Cstring, (Clong,), flag)
end

function ERKStepGetReturnFlagName(flag)
    ERKStepGetReturnFlagName(convert(Clong, flag))
end

function ERKStepWriteParameters(arkode_mem, fp)
    ccall((:ERKStepWriteParameters, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Libc.FILE}), arkode_mem, fp)
end

function ERKStepWriteButcher(arkode_mem, fp)
    ccall((:ERKStepWriteButcher, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Libc.FILE}), arkode_mem, fp)
end

function ERKStepGetTimestepperStats(arkode_mem, expsteps, accsteps, step_attempts, nfevals, netfails)
    ccall((:ERKStepGetTimestepperStats, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}), arkode_mem, expsteps, accsteps, step_attempts, nfevals, netfails)
end

function ERKStepGetStepStats(arkode_mem, nsteps, hinused, hlast, hcur, tcur)
    ccall((:ERKStepGetStepStats, libsundials_arkode), Cint, (ERKStepMemPtr, Ptr{Clong}, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}), arkode_mem, nsteps, hinused, hlast, hcur, tcur)
end

function ERKStepFree(arkode_mem)
    ccall((:ERKStepFree, libsundials_arkode), Cvoid, (Ref{ERKStepMemPtr},), arkode_mem)
end

function ERKStepPrintMem(arkode_mem, outfile)
    ccall((:ERKStepPrintMem, libsundials_arkode), Cvoid, (ERKStepMemPtr, Ptr{Libc.FILE}), arkode_mem, outfile)
end

function MRIStepCreate(fs::ARKRhsFn, t0::realtype, y0::N_Vector, inner_step_id::MRISTEP_ID, inner_step_mem)
    ccall((:MRIStepCreate, libsundials_arkode), MRIStepMemPtr, (ARKRhsFn, realtype, N_Vector, MRISTEP_ID, Ptr{Cvoid}), fs, t0, y0, inner_step_id, inner_step_mem)
end

function MRIStepCreate(fs, t0, y0, inner_step_id, inner_step_mem)
    __y0 = convert(NVector, y0)
    MRIStepCreate(ARKRhsFn_wrapper(fs), t0, convert(N_Vector, __y0), inner_step_id, inner_step_mem)
end

function MRIStepResize(arkode_mem, ynew::N_Vector, t0::realtype, resize::ARKVecResizeFn, resize_data)
    ccall((:MRIStepResize, libsundials_arkode), Cint, (MRIStepMemPtr, N_Vector, realtype, ARKVecResizeFn, Ptr{Cvoid}), arkode_mem, ynew, t0, resize, resize_data)
end

function MRIStepResize(arkode_mem, ynew, t0, resize, resize_data)
    __ynew = convert(NVector, ynew)
    MRIStepResize(arkode_mem, convert(N_Vector, __ynew), t0, resize, resize_data)
end

function MRIStepReInit(arkode_mem, fs::ARKRhsFn, t0::realtype, y0::N_Vector)
    ccall((:MRIStepReInit, libsundials_arkode), Cint, (MRIStepMemPtr, ARKRhsFn, realtype, N_Vector), arkode_mem, fs, t0, y0)
end

function MRIStepReInit(arkode_mem, fs, t0, y0)
    __y0 = convert(NVector, y0)
    MRIStepReInit(arkode_mem, ARKRhsFn_wrapper(fs), t0, convert(N_Vector, __y0))
end

function MRIStepRootInit(arkode_mem, nrtfn::Cint, g::ARKRootFn)
    ccall((:MRIStepRootInit, libsundials_arkode), Cint, (MRIStepMemPtr, Cint, ARKRootFn), arkode_mem, nrtfn, g)
end

function MRIStepRootInit(arkode_mem, nrtfn, g)
    MRIStepRootInit(arkode_mem, convert(Cint, nrtfn), g)
end

function MRIStepSetDefaults(arkode_mem)
    ccall((:MRIStepSetDefaults, libsundials_arkode), Cint, (MRIStepMemPtr,), arkode_mem)
end

function MRIStepSetInterpolantType(arkode_mem, itype::Cint)
    ccall((:MRIStepSetInterpolantType, libsundials_arkode), Cint, (MRIStepMemPtr, Cint), arkode_mem, itype)
end

function MRIStepSetInterpolantType(arkode_mem, itype)
    MRIStepSetInterpolantType(arkode_mem, convert(Cint, itype))
end

function MRIStepSetInterpolantDegree(arkode_mem, degree::Cint)
    ccall((:MRIStepSetInterpolantDegree, libsundials_arkode), Cint, (MRIStepMemPtr, Cint), arkode_mem, degree)
end

function MRIStepSetInterpolantDegree(arkode_mem, degree)
    MRIStepSetInterpolantDegree(arkode_mem, convert(Cint, degree))
end

function MRIStepSetDenseOrder(arkode_mem, dord::Cint)
    ccall((:MRIStepSetDenseOrder, libsundials_arkode), Cint, (MRIStepMemPtr, Cint), arkode_mem, dord)
end

function MRIStepSetDenseOrder(arkode_mem, dord)
    MRIStepSetDenseOrder(arkode_mem, convert(Cint, dord))
end

function MRIStepSetTable(arkode_mem, q::Cint, B::ARKodeButcherTable)
    ccall((:MRIStepSetTable, libsundials_arkode), Cint, (MRIStepMemPtr, Cint, ARKodeButcherTable), arkode_mem, q, B)
end

function MRIStepSetTable(arkode_mem, q, B)
    MRIStepSetTable(arkode_mem, convert(Cint, q), B)
end

function MRIStepSetTableNum(arkode_mem, itable::Cint)
    ccall((:MRIStepSetTableNum, libsundials_arkode), Cint, (MRIStepMemPtr, Cint), arkode_mem, itable)
end

function MRIStepSetTableNum(arkode_mem, itable)
    MRIStepSetTableNum(arkode_mem, convert(Cint, itable))
end

function MRIStepSetMaxNumSteps(arkode_mem, mxsteps::Clong)
    ccall((:MRIStepSetMaxNumSteps, libsundials_arkode), Cint, (MRIStepMemPtr, Clong), arkode_mem, mxsteps)
end

function MRIStepSetMaxNumSteps(arkode_mem, mxsteps)
    MRIStepSetMaxNumSteps(arkode_mem, convert(Clong, mxsteps))
end

function MRIStepSetMaxHnilWarns(arkode_mem, mxhnil::Cint)
    ccall((:MRIStepSetMaxHnilWarns, libsundials_arkode), Cint, (MRIStepMemPtr, Cint), arkode_mem, mxhnil)
end

function MRIStepSetMaxHnilWarns(arkode_mem, mxhnil)
    MRIStepSetMaxHnilWarns(arkode_mem, convert(Cint, mxhnil))
end

function MRIStepSetStopTime(arkode_mem, tstop::realtype)
    ccall((:MRIStepSetStopTime, libsundials_arkode), Cint, (MRIStepMemPtr, realtype), arkode_mem, tstop)
end

function MRIStepSetFixedStep(arkode_mem, hsfixed::realtype)
    ccall((:MRIStepSetFixedStep, libsundials_arkode), Cint, (MRIStepMemPtr, realtype), arkode_mem, hsfixed)
end

function MRIStepSetRootDirection(arkode_mem, rootdir)
    ccall((:MRIStepSetRootDirection, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{Cint}), arkode_mem, rootdir)
end

function MRIStepSetNoInactiveRootWarn(arkode_mem)
    ccall((:MRIStepSetNoInactiveRootWarn, libsundials_arkode), Cint, (MRIStepMemPtr,), arkode_mem)
end

function MRIStepSetErrHandlerFn(arkode_mem, ehfun::ARKErrHandlerFn, eh_data)
    ccall((:MRIStepSetErrHandlerFn, libsundials_arkode), Cint, (MRIStepMemPtr, ARKErrHandlerFn, Ptr{Cvoid}), arkode_mem, ehfun, eh_data)
end

function MRIStepSetErrFile(arkode_mem, errfp)
    ccall((:MRIStepSetErrFile, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{Libc.FILE}), arkode_mem, errfp)
end

function MRIStepSetUserData(arkode_mem, user_data)
    ccall((:MRIStepSetUserData, libsundials_arkode), Cint, (MRIStepMemPtr, Any), arkode_mem, user_data)
end

function MRIStepSetDiagnostics(arkode_mem, diagfp)
    ccall((:MRIStepSetDiagnostics, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{Libc.FILE}), arkode_mem, diagfp)
end

function MRIStepSetPostprocessStepFn(arkode_mem, ProcessStep::ARKPostProcessFn)
    ccall((:MRIStepSetPostprocessStepFn, libsundials_arkode), Cint, (MRIStepMemPtr, ARKPostProcessFn), arkode_mem, ProcessStep)
end

function MRIStepSetPostprocessStageFn(arkode_mem, ProcessStage::ARKPostProcessFn)
    ccall((:MRIStepSetPostprocessStageFn, libsundials_arkode), Cint, (MRIStepMemPtr, ARKPostProcessFn), arkode_mem, ProcessStage)
end

function MRIStepSetPreInnerFn(arkode_mem, prefn::MRIStepPreInnerFn)
    ccall((:MRIStepSetPreInnerFn, libsundials_arkode), Cint, (MRIStepMemPtr, MRIStepPreInnerFn), arkode_mem, prefn)
end

function MRIStepSetPostInnerFn(arkode_mem, postfn::MRIStepPostInnerFn)
    ccall((:MRIStepSetPostInnerFn, libsundials_arkode), Cint, (MRIStepMemPtr, MRIStepPostInnerFn), arkode_mem, postfn)
end

function MRIStepEvolve(arkode_mem, tout::realtype, yout::N_Vector, tret, itask::Cint)
    ccall((:MRIStepEvolve, libsundials_arkode), Cint, (MRIStepMemPtr, realtype, N_Vector, Ptr{realtype}, Cint), arkode_mem, tout, yout, tret, itask)
end

function MRIStepEvolve(arkode_mem, tout, yout, tret, itask)
    __yout = convert(NVector, yout)
    MRIStepEvolve(arkode_mem, tout, convert(N_Vector, __yout), tret, convert(Cint, itask))
end

function MRIStepGetDky(arkode_mem, t::realtype, k::Cint, dky::N_Vector)
    ccall((:MRIStepGetDky, libsundials_arkode), Cint, (MRIStepMemPtr, realtype, Cint, N_Vector), arkode_mem, t, k, dky)
end

function MRIStepGetDky(arkode_mem, t, k, dky)
    __dky = convert(NVector, dky)
    MRIStepGetDky(arkode_mem, t, convert(Cint, k), convert(N_Vector, __dky))
end

function MRIStepGetNumRhsEvals(arkode_mem, nfs_evals)
    ccall((:MRIStepGetNumRhsEvals, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{Clong}), arkode_mem, nfs_evals)
end

function MRIStepGetCurrentButcherTables(arkode_mem, B)
    ccall((:MRIStepGetCurrentButcherTables, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{ARKodeButcherTable}), arkode_mem, B)
end

function MRIStepGetWorkSpace(arkode_mem, lenrw, leniw)
    ccall((:MRIStepGetWorkSpace, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{Clong}, Ptr{Clong}), arkode_mem, lenrw, leniw)
end

function MRIStepGetNumSteps(arkode_mem, nssteps)
    ccall((:MRIStepGetNumSteps, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{Clong}), arkode_mem, nssteps)
end

function MRIStepGetLastStep(arkode_mem, hlast)
    ccall((:MRIStepGetLastStep, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{realtype}), arkode_mem, hlast)
end

function MRIStepGetCurrentTime(arkode_mem, tcur)
    ccall((:MRIStepGetCurrentTime, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{realtype}), arkode_mem, tcur)
end

function MRIStepGetCurrentState(arkode_mem, ycur)
    ccall((:MRIStepGetCurrentState, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{N_Vector}), arkode_mem, ycur)
end

function MRIStepGetNumGEvals(arkode_mem, ngevals)
    ccall((:MRIStepGetNumGEvals, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{Clong}), arkode_mem, ngevals)
end

function MRIStepGetRootInfo(arkode_mem, rootsfound)
    ccall((:MRIStepGetRootInfo, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{Cint}), arkode_mem, rootsfound)
end

function MRIStepGetLastInnerStepFlag(arkode_mem, flag)
    ccall((:MRIStepGetLastInnerStepFlag, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{Cint}), arkode_mem, flag)
end

function MRIStepGetReturnFlagName(flag::Clong)
    ccall((:MRIStepGetReturnFlagName, libsundials_arkode), Cstring, (Clong,), flag)
end

function MRIStepGetReturnFlagName(flag)
    MRIStepGetReturnFlagName(convert(Clong, flag))
end

function MRIStepWriteParameters(arkode_mem, fp)
    ccall((:MRIStepWriteParameters, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{Libc.FILE}), arkode_mem, fp)
end

function MRIStepWriteButcher(arkode_mem, fp)
    ccall((:MRIStepWriteButcher, libsundials_arkode), Cint, (MRIStepMemPtr, Ptr{Libc.FILE}), arkode_mem, fp)
end

function MRIStepFree(arkode_mem)
    ccall((:MRIStepFree, libsundials_arkode), Cvoid, (Ref{MRIStepMemPtr},), arkode_mem)
end

function MRIStepPrintMem(arkode_mem, outfile)
    ccall((:MRIStepPrintMem, libsundials_arkode), Cvoid, (MRIStepMemPtr, Ptr{Libc.FILE}), arkode_mem, outfile)
end

function CVodeCreate(lmm::Cint)
    ccall((:CVodeCreate, libsundials_cvodes), CVODEMemPtr, (Cint,), lmm)
end

function CVodeCreate(lmm)
    CVodeCreate(convert(Cint, lmm))
end

function CVodeInit(cvode_mem, f::CVRhsFn, t0::realtype, y0::N_Vector)
    ccall((:CVodeInit, libsundials_cvodes), Cint, (CVODEMemPtr, CVRhsFn, realtype, N_Vector), cvode_mem, f, t0, y0)
end

function CVodeInit(cvode_mem, f, t0, y0)
    __y0 = convert(NVector, y0)
    CVodeInit(cvode_mem, CVRhsFn_wrapper(f), t0, convert(N_Vector, __y0))
end

function CVodeReInit(cvode_mem, t0::realtype, y0::N_Vector)
    ccall((:CVodeReInit, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, N_Vector), cvode_mem, t0, y0)
end

function CVodeReInit(cvode_mem, t0, y0)
    __y0 = convert(NVector, y0)
    CVodeReInit(cvode_mem, t0, convert(N_Vector, __y0))
end

function CVodeSStolerances(cvode_mem, reltol::realtype, abstol::realtype)
    ccall((:CVodeSStolerances, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, realtype), cvode_mem, reltol, abstol)
end

function CVodeSVtolerances(cvode_mem, reltol::realtype, abstol::N_Vector)
    ccall((:CVodeSVtolerances, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, N_Vector), cvode_mem, reltol, abstol)
end

function CVodeSVtolerances(cvode_mem, reltol, abstol)
    __abstol = convert(NVector, abstol)
    CVodeSVtolerances(cvode_mem, reltol, convert(N_Vector, __abstol))
end

function CVodeWFtolerances(cvode_mem, efun::CVEwtFn)
    ccall((:CVodeWFtolerances, libsundials_cvodes), Cint, (CVODEMemPtr, CVEwtFn), cvode_mem, efun)
end

function CVodeSetErrHandlerFn(cvode_mem, ehfun::CVErrHandlerFn, eh_data)
    ccall((:CVodeSetErrHandlerFn, libsundials_cvodes), Cint, (CVODEMemPtr, CVErrHandlerFn, Ptr{Cvoid}), cvode_mem, ehfun, eh_data)
end

function CVodeSetErrFile(cvode_mem, errfp)
    ccall((:CVodeSetErrFile, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Libc.FILE}), cvode_mem, errfp)
end

function CVodeSetUserData(cvode_mem, user_data)
    ccall((:CVodeSetUserData, libsundials_cvodes), Cint, (CVODEMemPtr, Any), cvode_mem, user_data)
end

function CVodeSetMaxOrd(cvode_mem, maxord::Cint)
    ccall((:CVodeSetMaxOrd, libsundials_cvodes), Cint, (CVODEMemPtr, Cint), cvode_mem, maxord)
end

function CVodeSetMaxOrd(cvode_mem, maxord)
    CVodeSetMaxOrd(cvode_mem, convert(Cint, maxord))
end

function CVodeSetMaxNumSteps(cvode_mem, mxsteps::Clong)
    ccall((:CVodeSetMaxNumSteps, libsundials_cvodes), Cint, (CVODEMemPtr, Clong), cvode_mem, mxsteps)
end

function CVodeSetMaxNumSteps(cvode_mem, mxsteps)
    CVodeSetMaxNumSteps(cvode_mem, convert(Clong, mxsteps))
end

function CVodeSetMaxHnilWarns(cvode_mem, mxhnil::Cint)
    ccall((:CVodeSetMaxHnilWarns, libsundials_cvodes), Cint, (CVODEMemPtr, Cint), cvode_mem, mxhnil)
end

function CVodeSetMaxHnilWarns(cvode_mem, mxhnil)
    CVodeSetMaxHnilWarns(cvode_mem, convert(Cint, mxhnil))
end

function CVodeSetStabLimDet(cvode_mem, stldet::Cint)
    ccall((:CVodeSetStabLimDet, libsundials_cvodes), Cint, (CVODEMemPtr, Cint), cvode_mem, stldet)
end

function CVodeSetStabLimDet(cvode_mem, stldet)
    CVodeSetStabLimDet(cvode_mem, convert(Cint, stldet))
end

function CVodeSetInitStep(cvode_mem, hin::realtype)
    ccall((:CVodeSetInitStep, libsundials_cvodes), Cint, (CVODEMemPtr, realtype), cvode_mem, hin)
end

function CVodeSetMinStep(cvode_mem, hmin::realtype)
    ccall((:CVodeSetMinStep, libsundials_cvodes), Cint, (CVODEMemPtr, realtype), cvode_mem, hmin)
end

function CVodeSetMaxStep(cvode_mem, hmax::realtype)
    ccall((:CVodeSetMaxStep, libsundials_cvodes), Cint, (CVODEMemPtr, realtype), cvode_mem, hmax)
end

function CVodeSetStopTime(cvode_mem, tstop::realtype)
    ccall((:CVodeSetStopTime, libsundials_cvodes), Cint, (CVODEMemPtr, realtype), cvode_mem, tstop)
end

function CVodeSetMaxErrTestFails(cvode_mem, maxnef::Cint)
    ccall((:CVodeSetMaxErrTestFails, libsundials_cvodes), Cint, (CVODEMemPtr, Cint), cvode_mem, maxnef)
end

function CVodeSetMaxErrTestFails(cvode_mem, maxnef)
    CVodeSetMaxErrTestFails(cvode_mem, convert(Cint, maxnef))
end

function CVodeSetMaxNonlinIters(cvode_mem, maxcor::Cint)
    ccall((:CVodeSetMaxNonlinIters, libsundials_cvodes), Cint, (CVODEMemPtr, Cint), cvode_mem, maxcor)
end

function CVodeSetMaxNonlinIters(cvode_mem, maxcor)
    CVodeSetMaxNonlinIters(cvode_mem, convert(Cint, maxcor))
end

function CVodeSetMaxConvFails(cvode_mem, maxncf::Cint)
    ccall((:CVodeSetMaxConvFails, libsundials_cvodes), Cint, (CVODEMemPtr, Cint), cvode_mem, maxncf)
end

function CVodeSetMaxConvFails(cvode_mem, maxncf)
    CVodeSetMaxConvFails(cvode_mem, convert(Cint, maxncf))
end

function CVodeSetNonlinConvCoef(cvode_mem, nlscoef::realtype)
    ccall((:CVodeSetNonlinConvCoef, libsundials_cvodes), Cint, (CVODEMemPtr, realtype), cvode_mem, nlscoef)
end

function CVodeSetConstraints(cvode_mem, constraints::N_Vector)
    ccall((:CVodeSetConstraints, libsundials_cvodes), Cint, (CVODEMemPtr, N_Vector), cvode_mem, constraints)
end

function CVodeSetConstraints(cvode_mem, constraints)
    __constraints = convert(NVector, constraints)
    CVodeSetConstraints(cvode_mem, convert(N_Vector, __constraints))
end

function CVodeSetNonlinearSolver(cvode_mem, NLS::SUNNonlinearSolver)
    ccall((:CVodeSetNonlinearSolver, libsundials_cvodes), Cint, (CVODEMemPtr, SUNNonlinearSolver), cvode_mem, NLS)
end

function CVodeRootInit(cvode_mem, nrtfn::Cint, g::CVRootFn)
    ccall((:CVodeRootInit, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVRootFn), cvode_mem, nrtfn, g)
end

function CVodeRootInit(cvode_mem, nrtfn, g)
    CVodeRootInit(cvode_mem, convert(Cint, nrtfn), CVRootFn_wrapper(g))
end

function CVodeSetRootDirection(cvode_mem, rootdir)
    ccall((:CVodeSetRootDirection, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Cint}), cvode_mem, rootdir)
end

function CVodeSetNoInactiveRootWarn(cvode_mem)
    ccall((:CVodeSetNoInactiveRootWarn, libsundials_cvodes), Cint, (CVODEMemPtr,), cvode_mem)
end

function CVode(cvode_mem, tout::realtype, yout::N_Vector, tret, itask::Cint)
    ccall((:CVode, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, N_Vector, Ptr{realtype}, Cint), cvode_mem, tout, yout, tret, itask)
end

function CVode(cvode_mem, tout, yout, tret, itask)
    __yout = convert(NVector, yout)
    CVode(cvode_mem, tout, convert(N_Vector, __yout), tret, convert(Cint, itask))
end

function CVodeGetDky(cvode_mem, t::realtype, k::Cint, dky::N_Vector)
    ccall((:CVodeGetDky, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, Cint, N_Vector), cvode_mem, t, k, dky)
end

function CVodeGetDky(cvode_mem, t, k, dky)
    __dky = convert(NVector, dky)
    CVodeGetDky(cvode_mem, t, convert(Cint, k), convert(N_Vector, __dky))
end

function CVodeGetWorkSpace(cvode_mem, lenrw, leniw)
    ccall((:CVodeGetWorkSpace, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}, Ptr{Clong}), cvode_mem, lenrw, leniw)
end

function CVodeGetNumSteps(cvode_mem, nsteps)
    ccall((:CVodeGetNumSteps, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nsteps)
end

function CVodeGetNumRhsEvals(cvode_mem, nfevals)
    ccall((:CVodeGetNumRhsEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nfevals)
end

function CVodeGetNumLinSolvSetups(cvode_mem, nlinsetups)
    ccall((:CVodeGetNumLinSolvSetups, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nlinsetups)
end

function CVodeGetNumErrTestFails(cvode_mem, netfails)
    ccall((:CVodeGetNumErrTestFails, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, netfails)
end

function CVodeGetLastOrder(cvode_mem, qlast)
    ccall((:CVodeGetLastOrder, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Cint}), cvode_mem, qlast)
end

function CVodeGetCurrentOrder(cvode_mem, qcur)
    ccall((:CVodeGetCurrentOrder, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Cint}), cvode_mem, qcur)
end

function CVodeGetCurrentGamma(cvode_mem, gamma)
    ccall((:CVodeGetCurrentGamma, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{realtype}), cvode_mem, gamma)
end

function CVodeGetNumStabLimOrderReds(cvode_mem, nslred)
    ccall((:CVodeGetNumStabLimOrderReds, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nslred)
end

function CVodeGetActualInitStep(cvode_mem, hinused)
    ccall((:CVodeGetActualInitStep, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{realtype}), cvode_mem, hinused)
end

function CVodeGetLastStep(cvode_mem, hlast)
    ccall((:CVodeGetLastStep, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{realtype}), cvode_mem, hlast)
end

function CVodeGetCurrentStep(cvode_mem, hcur)
    ccall((:CVodeGetCurrentStep, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{realtype}), cvode_mem, hcur)
end

function CVodeGetCurrentState(cvode_mem, y)
    ccall((:CVodeGetCurrentState, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{N_Vector}), cvode_mem, y)
end

function CVodeGetCurrentTime(cvode_mem, tcur)
    ccall((:CVodeGetCurrentTime, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{realtype}), cvode_mem, tcur)
end

function CVodeGetTolScaleFactor(cvode_mem, tolsfac)
    ccall((:CVodeGetTolScaleFactor, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{realtype}), cvode_mem, tolsfac)
end

function CVodeGetErrWeights(cvode_mem, eweight::N_Vector)
    ccall((:CVodeGetErrWeights, libsundials_cvodes), Cint, (CVODEMemPtr, N_Vector), cvode_mem, eweight)
end

function CVodeGetErrWeights(cvode_mem, eweight)
    __eweight = convert(NVector, eweight)
    CVodeGetErrWeights(cvode_mem, convert(N_Vector, __eweight))
end

function CVodeGetEstLocalErrors(cvode_mem, ele::N_Vector)
    ccall((:CVodeGetEstLocalErrors, libsundials_cvodes), Cint, (CVODEMemPtr, N_Vector), cvode_mem, ele)
end

function CVodeGetEstLocalErrors(cvode_mem, ele)
    __ele = convert(NVector, ele)
    CVodeGetEstLocalErrors(cvode_mem, convert(N_Vector, __ele))
end

function CVodeGetNumGEvals(cvode_mem, ngevals)
    ccall((:CVodeGetNumGEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, ngevals)
end

function CVodeGetRootInfo(cvode_mem, rootsfound)
    ccall((:CVodeGetRootInfo, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Cint}), cvode_mem, rootsfound)
end

function CVodeGetIntegratorStats(cvode_mem, nsteps, nfevals, nlinsetups, netfails, qlast, qcur, hinused, hlast, hcur, tcur)
    ccall((:CVodeGetIntegratorStats, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Cint}, Ptr{Cint}, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}), cvode_mem, nsteps, nfevals, nlinsetups, netfails, qlast, qcur, hinused, hlast, hcur, tcur)
end

function CVodeGetNumNonlinSolvIters(cvode_mem, nniters)
    ccall((:CVodeGetNumNonlinSolvIters, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nniters)
end

function CVodeGetNumNonlinSolvConvFails(cvode_mem, nncfails)
    ccall((:CVodeGetNumNonlinSolvConvFails, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nncfails)
end

function CVodeGetNonlinSolvStats(cvode_mem, nniters, nncfails)
    ccall((:CVodeGetNonlinSolvStats, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}, Ptr{Clong}), cvode_mem, nniters, nncfails)
end

function CVodeGetReturnFlagName(flag::Clong)
    ccall((:CVodeGetReturnFlagName, libsundials_cvodes), Cstring, (Clong,), flag)
end

function CVodeGetReturnFlagName(flag)
    CVodeGetReturnFlagName(convert(Clong, flag))
end

function CVodeFree(cvode_mem)
    ccall((:CVodeFree, libsundials_cvodes), Cvoid, (Ref{CVODEMemPtr},), cvode_mem)
end

function CVBandPrecInit(cvode_mem, N::sunindextype, mu::sunindextype, ml::sunindextype)
    ccall((:CVBandPrecInit, libsundials_cvodes), Cint, (CVODEMemPtr, sunindextype, sunindextype, sunindextype), cvode_mem, N, mu, ml)
end

function CVBandPrecGetWorkSpace(cvode_mem, lenrwLS, leniwLS)
    ccall((:CVBandPrecGetWorkSpace, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}, Ptr{Clong}), cvode_mem, lenrwLS, leniwLS)
end

function CVBandPrecGetNumRhsEvals(cvode_mem, nfevalsBP)
    ccall((:CVBandPrecGetNumRhsEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nfevalsBP)
end

function CVBBDPrecInit(cvode_mem, Nlocal::sunindextype, mudq::sunindextype, mldq::sunindextype, mukeep::sunindextype, mlkeep::sunindextype, dqrely::realtype, gloc::CVLocalFn, cfn::CVCommFn)
    ccall((:CVBBDPrecInit, libsundials_cvodes), Cint, (CVODEMemPtr, sunindextype, sunindextype, sunindextype, sunindextype, sunindextype, realtype, CVLocalFn, CVCommFn), cvode_mem, Nlocal, mudq, mldq, mukeep, mlkeep, dqrely, gloc, cfn)
end

function CVBBDPrecReInit(cvode_mem, mudq::sunindextype, mldq::sunindextype, dqrely::realtype)
    ccall((:CVBBDPrecReInit, libsundials_cvodes), Cint, (CVODEMemPtr, sunindextype, sunindextype, realtype), cvode_mem, mudq, mldq, dqrely)
end

function CVBBDPrecGetWorkSpace(cvode_mem, lenrwBBDP, leniwBBDP)
    ccall((:CVBBDPrecGetWorkSpace, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}, Ptr{Clong}), cvode_mem, lenrwBBDP, leniwBBDP)
end

function CVBBDPrecGetNumGfnEvals(cvode_mem, ngevalsBBDP)
    ccall((:CVBBDPrecGetNumGfnEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, ngevalsBBDP)
end

function CVDiag(cvode_mem)
    ccall((:CVDiag, libsundials_cvodes), Cint, (CVODEMemPtr,), cvode_mem)
end

function CVDiagGetWorkSpace(cvode_mem, lenrwLS, leniwLS)
    ccall((:CVDiagGetWorkSpace, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}, Ptr{Clong}), cvode_mem, lenrwLS, leniwLS)
end

function CVDiagGetNumRhsEvals(cvode_mem, nfevalsLS)
    ccall((:CVDiagGetNumRhsEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nfevalsLS)
end

function CVDiagGetLastFlag(cvode_mem, flag)
    ccall((:CVDiagGetLastFlag, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, flag)
end

function CVDiagGetReturnFlagName(flag::Clong)
    ccall((:CVDiagGetReturnFlagName, libsundials_cvodes), Cstring, (Clong,), flag)
end

function CVDiagGetReturnFlagName(flag)
    CVDiagGetReturnFlagName(convert(Clong, flag))
end

function CVDlsSetLinearSolver(cvode_mem, LS::SUNLinearSolver, A::SUNMatrix)
    ccall((:CVDlsSetLinearSolver, libsundials_cvodes), Cint, (CVODEMemPtr, SUNLinearSolver, SUNMatrix), cvode_mem, LS, A)
end

function CVDlsSetJacFn(cvode_mem, jac::CVDlsJacFn)
    ccall((:CVDlsSetJacFn, libsundials_cvodes), Cint, (CVODEMemPtr, CVDlsJacFn), cvode_mem, jac)
end

function CVDlsGetWorkSpace(cvode_mem, lenrwLS, leniwLS)
    ccall((:CVDlsGetWorkSpace, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}, Ptr{Clong}), cvode_mem, lenrwLS, leniwLS)
end

function CVDlsGetNumJacEvals(cvode_mem, njevals)
    ccall((:CVDlsGetNumJacEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, njevals)
end

function CVDlsGetNumRhsEvals(cvode_mem, nfevalsLS)
    ccall((:CVDlsGetNumRhsEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nfevalsLS)
end

function CVDlsGetLastFlag(cvode_mem, flag)
    ccall((:CVDlsGetLastFlag, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, flag)
end

function CVDlsGetReturnFlagName(flag::Clong)
    ccall((:CVDlsGetReturnFlagName, libsundials_cvodes), Cstring, (Clong,), flag)
end

function CVDlsGetReturnFlagName(flag)
    CVDlsGetReturnFlagName(convert(Clong, flag))
end

function CVodeSetLinearSolver(cvode_mem, LS::SUNLinearSolver, A::SUNMatrix)
    ccall((:CVodeSetLinearSolver, libsundials_cvodes), Cint, (CVODEMemPtr, SUNLinearSolver, SUNMatrix), cvode_mem, LS, A)
end

function CVodeSetJacFn(cvode_mem, jac::CVLsJacFn)
    ccall((:CVodeSetJacFn, libsundials_cvodes), Cint, (CVODEMemPtr, CVLsJacFn), cvode_mem, jac)
end

function CVodeSetMaxStepsBetweenJac(cvode_mem, msbj::Clong)
    ccall((:CVodeSetMaxStepsBetweenJac, libsundials_cvodes), Cint, (CVODEMemPtr, Clong), cvode_mem, msbj)
end

function CVodeSetMaxStepsBetweenJac(cvode_mem, msbj)
    CVodeSetMaxStepsBetweenJac(cvode_mem, convert(Clong, msbj))
end

function CVodeSetLinearSolutionScaling(cvode_mem, onoff::Cint)
    ccall((:CVodeSetLinearSolutionScaling, libsundials_cvodes), Cint, (CVODEMemPtr, Cint), cvode_mem, onoff)
end

function CVodeSetLinearSolutionScaling(cvode_mem, onoff)
    CVodeSetLinearSolutionScaling(cvode_mem, convert(Cint, onoff))
end

function CVodeSetEpsLin(cvode_mem, eplifac::realtype)
    ccall((:CVodeSetEpsLin, libsundials_cvodes), Cint, (CVODEMemPtr, realtype), cvode_mem, eplifac)
end

function CVodeSetPreconditioner(cvode_mem, pset::CVLsPrecSetupFn, psolve::CVLsPrecSolveFn)
    ccall((:CVodeSetPreconditioner, libsundials_cvodes), Cint, (CVODEMemPtr, CVLsPrecSetupFn, CVLsPrecSolveFn), cvode_mem, pset, psolve)
end

function CVodeSetJacTimes(cvode_mem, jtsetup::CVLsJacTimesSetupFn, jtimes::CVLsJacTimesVecFn)
    ccall((:CVodeSetJacTimes, libsundials_cvodes), Cint, (CVODEMemPtr, CVLsJacTimesSetupFn, CVLsJacTimesVecFn), cvode_mem, jtsetup, jtimes)
end

function CVodeSetLinSysFn(cvode_mem, linsys::CVLsLinSysFn)
    ccall((:CVodeSetLinSysFn, libsundials_cvodes), Cint, (CVODEMemPtr, CVLsLinSysFn), cvode_mem, linsys)
end

function CVodeGetLinWorkSpace(cvode_mem, lenrwLS, leniwLS)
    ccall((:CVodeGetLinWorkSpace, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}, Ptr{Clong}), cvode_mem, lenrwLS, leniwLS)
end

function CVodeGetNumJacEvals(cvode_mem, njevals)
    ccall((:CVodeGetNumJacEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, njevals)
end

function CVodeGetNumPrecEvals(cvode_mem, npevals)
    ccall((:CVodeGetNumPrecEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, npevals)
end

function CVodeGetNumPrecSolves(cvode_mem, npsolves)
    ccall((:CVodeGetNumPrecSolves, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, npsolves)
end

function CVodeGetNumLinIters(cvode_mem, nliters)
    ccall((:CVodeGetNumLinIters, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nliters)
end

function CVodeGetNumLinConvFails(cvode_mem, nlcfails)
    ccall((:CVodeGetNumLinConvFails, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nlcfails)
end

function CVodeGetNumJTSetupEvals(cvode_mem, njtsetups)
    ccall((:CVodeGetNumJTSetupEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, njtsetups)
end

function CVodeGetNumJtimesEvals(cvode_mem, njvevals)
    ccall((:CVodeGetNumJtimesEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, njvevals)
end

function CVodeGetNumLinRhsEvals(cvode_mem, nfevalsLS)
    ccall((:CVodeGetNumLinRhsEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nfevalsLS)
end

function CVodeGetLastLinFlag(cvode_mem, flag)
    ccall((:CVodeGetLastLinFlag, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, flag)
end

function CVodeGetLinReturnFlagName(flag::Clong)
    ccall((:CVodeGetLinReturnFlagName, libsundials_cvodes), Cstring, (Clong,), flag)
end

function CVodeGetLinReturnFlagName(flag)
    CVodeGetLinReturnFlagName(convert(Clong, flag))
end

function CVSpilsSetLinearSolver(cvode_mem, LS::SUNLinearSolver)
    ccall((:CVSpilsSetLinearSolver, libsundials_cvodes), Cint, (CVODEMemPtr, SUNLinearSolver), cvode_mem, LS)
end

function CVSpilsSetEpsLin(cvode_mem, eplifac::realtype)
    ccall((:CVSpilsSetEpsLin, libsundials_cvodes), Cint, (CVODEMemPtr, realtype), cvode_mem, eplifac)
end

function CVSpilsSetPreconditioner(cvode_mem, pset::CVSpilsPrecSetupFn, psolve::CVSpilsPrecSolveFn)
    ccall((:CVSpilsSetPreconditioner, libsundials_cvodes), Cint, (CVODEMemPtr, CVSpilsPrecSetupFn, CVSpilsPrecSolveFn), cvode_mem, pset, psolve)
end

function CVSpilsSetJacTimes(cvode_mem, jtsetup::CVSpilsJacTimesSetupFn, jtimes::CVSpilsJacTimesVecFn)
    ccall((:CVSpilsSetJacTimes, libsundials_cvodes), Cint, (CVODEMemPtr, CVSpilsJacTimesSetupFn, CVSpilsJacTimesVecFn), cvode_mem, jtsetup, jtimes)
end

function CVSpilsGetWorkSpace(cvode_mem, lenrwLS, leniwLS)
    ccall((:CVSpilsGetWorkSpace, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}, Ptr{Clong}), cvode_mem, lenrwLS, leniwLS)
end

function CVSpilsGetNumPrecEvals(cvode_mem, npevals)
    ccall((:CVSpilsGetNumPrecEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, npevals)
end

function CVSpilsGetNumPrecSolves(cvode_mem, npsolves)
    ccall((:CVSpilsGetNumPrecSolves, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, npsolves)
end

function CVSpilsGetNumLinIters(cvode_mem, nliters)
    ccall((:CVSpilsGetNumLinIters, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nliters)
end

function CVSpilsGetNumConvFails(cvode_mem, nlcfails)
    ccall((:CVSpilsGetNumConvFails, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nlcfails)
end

function CVSpilsGetNumJTSetupEvals(cvode_mem, njtsetups)
    ccall((:CVSpilsGetNumJTSetupEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, njtsetups)
end

function CVSpilsGetNumJtimesEvals(cvode_mem, njvevals)
    ccall((:CVSpilsGetNumJtimesEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, njvevals)
end

function CVSpilsGetNumRhsEvals(cvode_mem, nfevalsLS)
    ccall((:CVSpilsGetNumRhsEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nfevalsLS)
end

function CVSpilsGetLastFlag(cvode_mem, flag)
    ccall((:CVSpilsGetLastFlag, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, flag)
end

function CVSpilsGetReturnFlagName(flag::Clong)
    ccall((:CVSpilsGetReturnFlagName, libsundials_cvodes), Cstring, (Clong,), flag)
end

function CVSpilsGetReturnFlagName(flag)
    CVSpilsGetReturnFlagName(convert(Clong, flag))
end

function CVodeGetCurrentStateSens(cvode_mem, yS)
    ccall((:CVodeGetCurrentStateSens, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Ptr{N_Vector}}), cvode_mem, yS)
end

function CVodeGetCurrentSensSolveIndex(cvode_mem, index)
    ccall((:CVodeGetCurrentSensSolveIndex, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Cint}), cvode_mem, index)
end

function CVodeQuadInit(cvode_mem, fQ::CVQuadRhsFn, yQ0::N_Vector)
    ccall((:CVodeQuadInit, libsundials_cvodes), Cint, (CVODEMemPtr, CVQuadRhsFn, N_Vector), cvode_mem, fQ, yQ0)
end

function CVodeQuadInit(cvode_mem, fQ, yQ0)
    __yQ0 = convert(NVector, yQ0)
    CVodeQuadInit(cvode_mem, fQ, convert(N_Vector, __yQ0))
end

function CVodeQuadReInit(cvode_mem, yQ0::N_Vector)
    ccall((:CVodeQuadReInit, libsundials_cvodes), Cint, (CVODEMemPtr, N_Vector), cvode_mem, yQ0)
end

function CVodeQuadReInit(cvode_mem, yQ0)
    __yQ0 = convert(NVector, yQ0)
    CVodeQuadReInit(cvode_mem, convert(N_Vector, __yQ0))
end

function CVodeQuadSStolerances(cvode_mem, reltolQ::realtype, abstolQ::realtype)
    ccall((:CVodeQuadSStolerances, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, realtype), cvode_mem, reltolQ, abstolQ)
end

function CVodeQuadSVtolerances(cvode_mem, reltolQ::realtype, abstolQ::N_Vector)
    ccall((:CVodeQuadSVtolerances, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, N_Vector), cvode_mem, reltolQ, abstolQ)
end

function CVodeQuadSVtolerances(cvode_mem, reltolQ, abstolQ)
    __abstolQ = convert(NVector, abstolQ)
    CVodeQuadSVtolerances(cvode_mem, reltolQ, convert(N_Vector, __abstolQ))
end

function CVodeSetQuadErrCon(cvode_mem, errconQ::Cint)
    ccall((:CVodeSetQuadErrCon, libsundials_cvodes), Cint, (CVODEMemPtr, Cint), cvode_mem, errconQ)
end

function CVodeSetQuadErrCon(cvode_mem, errconQ)
    CVodeSetQuadErrCon(cvode_mem, convert(Cint, errconQ))
end

function CVodeGetQuad(cvode_mem, tret, yQout::N_Vector)
    ccall((:CVodeGetQuad, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{realtype}, N_Vector), cvode_mem, tret, yQout)
end

function CVodeGetQuad(cvode_mem, tret, yQout)
    __yQout = convert(NVector, yQout)
    CVodeGetQuad(cvode_mem, tret, convert(N_Vector, __yQout))
end

function CVodeGetQuadDky(cvode_mem, t::realtype, k::Cint, dky::N_Vector)
    ccall((:CVodeGetQuadDky, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, Cint, N_Vector), cvode_mem, t, k, dky)
end

function CVodeGetQuadDky(cvode_mem, t, k, dky)
    __dky = convert(NVector, dky)
    CVodeGetQuadDky(cvode_mem, t, convert(Cint, k), convert(N_Vector, __dky))
end

function CVodeGetQuadNumRhsEvals(cvode_mem, nfQevals)
    ccall((:CVodeGetQuadNumRhsEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nfQevals)
end

function CVodeGetQuadNumErrTestFails(cvode_mem, nQetfails)
    ccall((:CVodeGetQuadNumErrTestFails, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nQetfails)
end

function CVodeGetQuadErrWeights(cvode_mem, eQweight::N_Vector)
    ccall((:CVodeGetQuadErrWeights, libsundials_cvodes), Cint, (CVODEMemPtr, N_Vector), cvode_mem, eQweight)
end

function CVodeGetQuadErrWeights(cvode_mem, eQweight)
    __eQweight = convert(NVector, eQweight)
    CVodeGetQuadErrWeights(cvode_mem, convert(N_Vector, __eQweight))
end

function CVodeGetQuadStats(cvode_mem, nfQevals, nQetfails)
    ccall((:CVodeGetQuadStats, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}, Ptr{Clong}), cvode_mem, nfQevals, nQetfails)
end

function CVodeQuadFree(cvode_mem)
    ccall((:CVodeQuadFree, libsundials_cvodes), Cvoid, (CVODEMemPtr,), cvode_mem)
end

function CVodeSensInit(cvode_mem, Ns::Cint, ism::Cint, fS::CVSensRhsFn, yS0)
    ccall((:CVodeSensInit, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Cint, CVSensRhsFn, Ptr{N_Vector}), cvode_mem, Ns, ism, fS, yS0)
end

function CVodeSensInit(cvode_mem, Ns, ism, fS, yS0)
    CVodeSensInit(cvode_mem, convert(Cint, Ns), convert(Cint, ism), fS, yS0)
end

function CVodeSensInit1(cvode_mem, Ns::Cint, ism::Cint, fS1::CVSensRhs1Fn, yS0)
    ccall((:CVodeSensInit1, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Cint, CVSensRhs1Fn, Ptr{N_Vector}), cvode_mem, Ns, ism, fS1, yS0)
end

function CVodeSensInit1(cvode_mem, Ns, ism, fS1, yS0)
    CVodeSensInit1(cvode_mem, convert(Cint, Ns), convert(Cint, ism), fS1, yS0)
end

function CVodeSensReInit(cvode_mem, ism::Cint, yS0)
    ccall((:CVodeSensReInit, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Ptr{N_Vector}), cvode_mem, ism, yS0)
end

function CVodeSensReInit(cvode_mem, ism, yS0)
    CVodeSensReInit(cvode_mem, convert(Cint, ism), yS0)
end

function CVodeSensSStolerances(cvode_mem, reltolS::realtype, abstolS)
    ccall((:CVodeSensSStolerances, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, Ptr{realtype}), cvode_mem, reltolS, abstolS)
end

function CVodeSensSVtolerances(cvode_mem, reltolS::realtype, abstolS)
    ccall((:CVodeSensSVtolerances, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, Ptr{N_Vector}), cvode_mem, reltolS, abstolS)
end

function CVodeSensEEtolerances(cvode_mem)
    ccall((:CVodeSensEEtolerances, libsundials_cvodes), Cint, (CVODEMemPtr,), cvode_mem)
end

function CVodeSetSensDQMethod(cvode_mem, DQtype::Cint, DQrhomax::realtype)
    ccall((:CVodeSetSensDQMethod, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, realtype), cvode_mem, DQtype, DQrhomax)
end

function CVodeSetSensDQMethod(cvode_mem, DQtype, DQrhomax)
    CVodeSetSensDQMethod(cvode_mem, convert(Cint, DQtype), DQrhomax)
end

function CVodeSetSensErrCon(cvode_mem, errconS::Cint)
    ccall((:CVodeSetSensErrCon, libsundials_cvodes), Cint, (CVODEMemPtr, Cint), cvode_mem, errconS)
end

function CVodeSetSensErrCon(cvode_mem, errconS)
    CVodeSetSensErrCon(cvode_mem, convert(Cint, errconS))
end

function CVodeSetSensMaxNonlinIters(cvode_mem, maxcorS::Cint)
    ccall((:CVodeSetSensMaxNonlinIters, libsundials_cvodes), Cint, (CVODEMemPtr, Cint), cvode_mem, maxcorS)
end

function CVodeSetSensMaxNonlinIters(cvode_mem, maxcorS)
    CVodeSetSensMaxNonlinIters(cvode_mem, convert(Cint, maxcorS))
end

function CVodeSetSensParams(cvode_mem, p, pbar, plist)
    ccall((:CVodeSetSensParams, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{realtype}, Ptr{realtype}, Ptr{Cint}), cvode_mem, p, pbar, plist)
end

function CVodeSetNonlinearSolverSensSim(cvode_mem, NLS::SUNNonlinearSolver)
    ccall((:CVodeSetNonlinearSolverSensSim, libsundials_cvodes), Cint, (CVODEMemPtr, SUNNonlinearSolver), cvode_mem, NLS)
end

function CVodeSetNonlinearSolverSensStg(cvode_mem, NLS::SUNNonlinearSolver)
    ccall((:CVodeSetNonlinearSolverSensStg, libsundials_cvodes), Cint, (CVODEMemPtr, SUNNonlinearSolver), cvode_mem, NLS)
end

function CVodeSetNonlinearSolverSensStg1(cvode_mem, NLS::SUNNonlinearSolver)
    ccall((:CVodeSetNonlinearSolverSensStg1, libsundials_cvodes), Cint, (CVODEMemPtr, SUNNonlinearSolver), cvode_mem, NLS)
end

function CVodeSensToggleOff(cvode_mem)
    ccall((:CVodeSensToggleOff, libsundials_cvodes), Cint, (CVODEMemPtr,), cvode_mem)
end

function CVodeGetSens(cvode_mem, tret, ySout)
    ccall((:CVodeGetSens, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{realtype}, Ptr{N_Vector}), cvode_mem, tret, ySout)
end

function CVodeGetSens1(cvode_mem, tret, is::Cint, ySout::N_Vector)
    ccall((:CVodeGetSens1, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{realtype}, Cint, N_Vector), cvode_mem, tret, is, ySout)
end

function CVodeGetSens1(cvode_mem, tret, is, ySout)
    __ySout = convert(NVector, ySout)
    CVodeGetSens1(cvode_mem, tret, convert(Cint, is), convert(N_Vector, __ySout))
end

function CVodeGetSensDky(cvode_mem, t::realtype, k::Cint, dkyA)
    ccall((:CVodeGetSensDky, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, Cint, Ptr{N_Vector}), cvode_mem, t, k, dkyA)
end

function CVodeGetSensDky(cvode_mem, t, k, dkyA)
    CVodeGetSensDky(cvode_mem, t, convert(Cint, k), dkyA)
end

function CVodeGetSensDky1(cvode_mem, t::realtype, k::Cint, is::Cint, dky::N_Vector)
    ccall((:CVodeGetSensDky1, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, Cint, Cint, N_Vector), cvode_mem, t, k, is, dky)
end

function CVodeGetSensDky1(cvode_mem, t, k, is, dky)
    __dky = convert(NVector, dky)
    CVodeGetSensDky1(cvode_mem, t, convert(Cint, k), convert(Cint, is), convert(N_Vector, __dky))
end

function CVodeGetSensNumRhsEvals(cvode_mem, nfSevals)
    ccall((:CVodeGetSensNumRhsEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nfSevals)
end

function CVodeGetNumRhsEvalsSens(cvode_mem, nfevalsS)
    ccall((:CVodeGetNumRhsEvalsSens, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nfevalsS)
end

function CVodeGetSensNumErrTestFails(cvode_mem, nSetfails)
    ccall((:CVodeGetSensNumErrTestFails, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nSetfails)
end

function CVodeGetSensNumLinSolvSetups(cvode_mem, nlinsetupsS)
    ccall((:CVodeGetSensNumLinSolvSetups, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nlinsetupsS)
end

function CVodeGetSensErrWeights(cvode_mem, eSweight)
    ccall((:CVodeGetSensErrWeights, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{N_Vector}), cvode_mem, eSweight)
end

function CVodeGetSensStats(cvode_mem, nfSevals, nfevalsS, nSetfails, nlinsetupsS)
    ccall((:CVodeGetSensStats, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}), cvode_mem, nfSevals, nfevalsS, nSetfails, nlinsetupsS)
end

function CVodeGetSensNumNonlinSolvIters(cvode_mem, nSniters)
    ccall((:CVodeGetSensNumNonlinSolvIters, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nSniters)
end

function CVodeGetSensNumNonlinSolvConvFails(cvode_mem, nSncfails)
    ccall((:CVodeGetSensNumNonlinSolvConvFails, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nSncfails)
end

function CVodeGetStgrSensNumNonlinSolvIters(cvode_mem, nSTGR1niters)
    ccall((:CVodeGetStgrSensNumNonlinSolvIters, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nSTGR1niters)
end

function CVodeGetStgrSensNumNonlinSolvConvFails(cvode_mem, nSTGR1ncfails)
    ccall((:CVodeGetStgrSensNumNonlinSolvConvFails, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nSTGR1ncfails)
end

function CVodeGetSensNonlinSolvStats(cvode_mem, nSniters, nSncfails)
    ccall((:CVodeGetSensNonlinSolvStats, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}, Ptr{Clong}), cvode_mem, nSniters, nSncfails)
end

function CVodeSensFree(cvode_mem)
    ccall((:CVodeSensFree, libsundials_cvodes), Cvoid, (CVODEMemPtr,), cvode_mem)
end

function CVodeQuadSensInit(cvode_mem, fQS::CVQuadSensRhsFn, yQS0)
    ccall((:CVodeQuadSensInit, libsundials_cvodes), Cint, (CVODEMemPtr, CVQuadSensRhsFn, Ptr{N_Vector}), cvode_mem, fQS, yQS0)
end

function CVodeQuadSensReInit(cvode_mem, yQS0)
    ccall((:CVodeQuadSensReInit, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{N_Vector}), cvode_mem, yQS0)
end

function CVodeQuadSensSStolerances(cvode_mem, reltolQS::realtype, abstolQS)
    ccall((:CVodeQuadSensSStolerances, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, Ptr{realtype}), cvode_mem, reltolQS, abstolQS)
end

function CVodeQuadSensSVtolerances(cvode_mem, reltolQS::realtype, abstolQS)
    ccall((:CVodeQuadSensSVtolerances, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, Ptr{N_Vector}), cvode_mem, reltolQS, abstolQS)
end

function CVodeQuadSensEEtolerances(cvode_mem)
    ccall((:CVodeQuadSensEEtolerances, libsundials_cvodes), Cint, (CVODEMemPtr,), cvode_mem)
end

function CVodeSetQuadSensErrCon(cvode_mem, errconQS::Cint)
    ccall((:CVodeSetQuadSensErrCon, libsundials_cvodes), Cint, (CVODEMemPtr, Cint), cvode_mem, errconQS)
end

function CVodeSetQuadSensErrCon(cvode_mem, errconQS)
    CVodeSetQuadSensErrCon(cvode_mem, convert(Cint, errconQS))
end

function CVodeGetQuadSens(cvode_mem, tret, yQSout)
    ccall((:CVodeGetQuadSens, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{realtype}, Ptr{N_Vector}), cvode_mem, tret, yQSout)
end

function CVodeGetQuadSens1(cvode_mem, tret, is::Cint, yQSout::N_Vector)
    ccall((:CVodeGetQuadSens1, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{realtype}, Cint, N_Vector), cvode_mem, tret, is, yQSout)
end

function CVodeGetQuadSens1(cvode_mem, tret, is, yQSout)
    __yQSout = convert(NVector, yQSout)
    CVodeGetQuadSens1(cvode_mem, tret, convert(Cint, is), convert(N_Vector, __yQSout))
end

function CVodeGetQuadSensDky(cvode_mem, t::realtype, k::Cint, dkyQS_all)
    ccall((:CVodeGetQuadSensDky, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, Cint, Ptr{N_Vector}), cvode_mem, t, k, dkyQS_all)
end

function CVodeGetQuadSensDky(cvode_mem, t, k, dkyQS_all)
    CVodeGetQuadSensDky(cvode_mem, t, convert(Cint, k), dkyQS_all)
end

function CVodeGetQuadSensDky1(cvode_mem, t::realtype, k::Cint, is::Cint, dkyQS::N_Vector)
    ccall((:CVodeGetQuadSensDky1, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, Cint, Cint, N_Vector), cvode_mem, t, k, is, dkyQS)
end

function CVodeGetQuadSensDky1(cvode_mem, t, k, is, dkyQS)
    __dkyQS = convert(NVector, dkyQS)
    CVodeGetQuadSensDky1(cvode_mem, t, convert(Cint, k), convert(Cint, is), convert(N_Vector, __dkyQS))
end

function CVodeGetQuadSensNumRhsEvals(cvode_mem, nfQSevals)
    ccall((:CVodeGetQuadSensNumRhsEvals, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nfQSevals)
end

function CVodeGetQuadSensNumErrTestFails(cvode_mem, nQSetfails)
    ccall((:CVodeGetQuadSensNumErrTestFails, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}), cvode_mem, nQSetfails)
end

function CVodeGetQuadSensErrWeights(cvode_mem, eQSweight)
    ccall((:CVodeGetQuadSensErrWeights, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{N_Vector}), cvode_mem, eQSweight)
end

function CVodeGetQuadSensStats(cvode_mem, nfQSevals, nQSetfails)
    ccall((:CVodeGetQuadSensStats, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Clong}, Ptr{Clong}), cvode_mem, nfQSevals, nQSetfails)
end

function CVodeQuadSensFree(cvode_mem)
    ccall((:CVodeQuadSensFree, libsundials_cvodes), Cvoid, (CVODEMemPtr,), cvode_mem)
end

function CVodeAdjInit(cvode_mem, steps::Clong, interp::Cint)
    ccall((:CVodeAdjInit, libsundials_cvodes), Cint, (CVODEMemPtr, Clong, Cint), cvode_mem, steps, interp)
end

function CVodeAdjInit(cvode_mem, steps, interp)
    CVodeAdjInit(cvode_mem, convert(Clong, steps), convert(Cint, interp))
end

function CVodeAdjReInit(cvode_mem)
    ccall((:CVodeAdjReInit, libsundials_cvodes), Cint, (CVODEMemPtr,), cvode_mem)
end

function CVodeAdjFree(cvode_mem)
    ccall((:CVodeAdjFree, libsundials_cvodes), Cvoid, (CVODEMemPtr,), cvode_mem)
end

function CVodeCreateB(cvode_mem, lmmB::Cint, which)
    ccall((:CVodeCreateB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Ptr{Cint}), cvode_mem, lmmB, which)
end

function CVodeCreateB(cvode_mem, lmmB, which)
    CVodeCreateB(cvode_mem, convert(Cint, lmmB), which)
end

function CVodeInitB(cvode_mem, which::Cint, fB::CVRhsFnB, tB0::realtype, yB0::N_Vector)
    ccall((:CVodeInitB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVRhsFnB, realtype, N_Vector), cvode_mem, which, fB, tB0, yB0)
end

function CVodeInitB(cvode_mem, which, fB, tB0, yB0)
    __yB0 = convert(NVector, yB0)
    CVodeInitB(cvode_mem, convert(Cint, which), fB, tB0, convert(N_Vector, __yB0))
end

function CVodeInitBS(cvode_mem, which::Cint, fBs::CVRhsFnBS, tB0::realtype, yB0::N_Vector)
    ccall((:CVodeInitBS, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVRhsFnBS, realtype, N_Vector), cvode_mem, which, fBs, tB0, yB0)
end

function CVodeInitBS(cvode_mem, which, fBs, tB0, yB0)
    __yB0 = convert(NVector, yB0)
    CVodeInitBS(cvode_mem, convert(Cint, which), fBs, tB0, convert(N_Vector, __yB0))
end

function CVodeReInitB(cvode_mem, which::Cint, tB0::realtype, yB0::N_Vector)
    ccall((:CVodeReInitB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, realtype, N_Vector), cvode_mem, which, tB0, yB0)
end

function CVodeReInitB(cvode_mem, which, tB0, yB0)
    __yB0 = convert(NVector, yB0)
    CVodeReInitB(cvode_mem, convert(Cint, which), tB0, convert(N_Vector, __yB0))
end

function CVodeSStolerancesB(cvode_mem, which::Cint, reltolB::realtype, abstolB::realtype)
    ccall((:CVodeSStolerancesB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, realtype, realtype), cvode_mem, which, reltolB, abstolB)
end

function CVodeSStolerancesB(cvode_mem, which, reltolB, abstolB)
    CVodeSStolerancesB(cvode_mem, convert(Cint, which), reltolB, abstolB)
end

function CVodeSVtolerancesB(cvode_mem, which::Cint, reltolB::realtype, abstolB::N_Vector)
    ccall((:CVodeSVtolerancesB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, realtype, N_Vector), cvode_mem, which, reltolB, abstolB)
end

function CVodeSVtolerancesB(cvode_mem, which, reltolB, abstolB)
    __abstolB = convert(NVector, abstolB)
    CVodeSVtolerancesB(cvode_mem, convert(Cint, which), reltolB, convert(N_Vector, __abstolB))
end

function CVodeQuadInitB(cvode_mem, which::Cint, fQB::CVQuadRhsFnB, yQB0::N_Vector)
    ccall((:CVodeQuadInitB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVQuadRhsFnB, N_Vector), cvode_mem, which, fQB, yQB0)
end

function CVodeQuadInitB(cvode_mem, which, fQB, yQB0)
    __yQB0 = convert(NVector, yQB0)
    CVodeQuadInitB(cvode_mem, convert(Cint, which), fQB, convert(N_Vector, __yQB0))
end

function CVodeQuadInitBS(cvode_mem, which::Cint, fQBs::CVQuadRhsFnBS, yQB0::N_Vector)
    ccall((:CVodeQuadInitBS, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVQuadRhsFnBS, N_Vector), cvode_mem, which, fQBs, yQB0)
end

function CVodeQuadInitBS(cvode_mem, which, fQBs, yQB0)
    __yQB0 = convert(NVector, yQB0)
    CVodeQuadInitBS(cvode_mem, convert(Cint, which), fQBs, convert(N_Vector, __yQB0))
end

function CVodeQuadReInitB(cvode_mem, which::Cint, yQB0::N_Vector)
    ccall((:CVodeQuadReInitB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, N_Vector), cvode_mem, which, yQB0)
end

function CVodeQuadReInitB(cvode_mem, which, yQB0)
    __yQB0 = convert(NVector, yQB0)
    CVodeQuadReInitB(cvode_mem, convert(Cint, which), convert(N_Vector, __yQB0))
end

function CVodeQuadSStolerancesB(cvode_mem, which::Cint, reltolQB::realtype, abstolQB::realtype)
    ccall((:CVodeQuadSStolerancesB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, realtype, realtype), cvode_mem, which, reltolQB, abstolQB)
end

function CVodeQuadSStolerancesB(cvode_mem, which, reltolQB, abstolQB)
    CVodeQuadSStolerancesB(cvode_mem, convert(Cint, which), reltolQB, abstolQB)
end

function CVodeQuadSVtolerancesB(cvode_mem, which::Cint, reltolQB::realtype, abstolQB::N_Vector)
    ccall((:CVodeQuadSVtolerancesB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, realtype, N_Vector), cvode_mem, which, reltolQB, abstolQB)
end

function CVodeQuadSVtolerancesB(cvode_mem, which, reltolQB, abstolQB)
    __abstolQB = convert(NVector, abstolQB)
    CVodeQuadSVtolerancesB(cvode_mem, convert(Cint, which), reltolQB, convert(N_Vector, __abstolQB))
end

function CVodeF(cvode_mem, tout::realtype, yout::N_Vector, tret, itask::Cint, ncheckPtr)
    ccall((:CVodeF, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, N_Vector, Ptr{realtype}, Cint, Ptr{Cint}), cvode_mem, tout, yout, tret, itask, ncheckPtr)
end

function CVodeF(cvode_mem, tout, yout, tret, itask, ncheckPtr)
    __yout = convert(NVector, yout)
    CVodeF(cvode_mem, tout, convert(N_Vector, __yout), tret, convert(Cint, itask), ncheckPtr)
end

function CVodeB(cvode_mem, tBout::realtype, itaskB::Cint)
    ccall((:CVodeB, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, Cint), cvode_mem, tBout, itaskB)
end

function CVodeB(cvode_mem, tBout, itaskB)
    CVodeB(cvode_mem, tBout, convert(Cint, itaskB))
end

function CVodeSetAdjNoSensi(cvode_mem)
    ccall((:CVodeSetAdjNoSensi, libsundials_cvodes), Cint, (CVODEMemPtr,), cvode_mem)
end

function CVodeSetUserDataB(cvode_mem, which::Cint, user_dataB)
    ccall((:CVodeSetUserDataB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Any), cvode_mem, which, user_dataB)
end

function CVodeSetUserDataB(cvode_mem, which, user_dataB)
    CVodeSetUserDataB(cvode_mem, convert(Cint, which), user_dataB)
end

function CVodeSetMaxOrdB(cvode_mem, which::Cint, maxordB::Cint)
    ccall((:CVodeSetMaxOrdB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Cint), cvode_mem, which, maxordB)
end

function CVodeSetMaxOrdB(cvode_mem, which, maxordB)
    CVodeSetMaxOrdB(cvode_mem, convert(Cint, which), convert(Cint, maxordB))
end

function CVodeSetMaxNumStepsB(cvode_mem, which::Cint, mxstepsB::Clong)
    ccall((:CVodeSetMaxNumStepsB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Clong), cvode_mem, which, mxstepsB)
end

function CVodeSetMaxNumStepsB(cvode_mem, which, mxstepsB)
    CVodeSetMaxNumStepsB(cvode_mem, convert(Cint, which), convert(Clong, mxstepsB))
end

function CVodeSetStabLimDetB(cvode_mem, which::Cint, stldetB::Cint)
    ccall((:CVodeSetStabLimDetB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Cint), cvode_mem, which, stldetB)
end

function CVodeSetStabLimDetB(cvode_mem, which, stldetB)
    CVodeSetStabLimDetB(cvode_mem, convert(Cint, which), convert(Cint, stldetB))
end

function CVodeSetInitStepB(cvode_mem, which::Cint, hinB::realtype)
    ccall((:CVodeSetInitStepB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, realtype), cvode_mem, which, hinB)
end

function CVodeSetInitStepB(cvode_mem, which, hinB)
    CVodeSetInitStepB(cvode_mem, convert(Cint, which), hinB)
end

function CVodeSetMinStepB(cvode_mem, which::Cint, hminB::realtype)
    ccall((:CVodeSetMinStepB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, realtype), cvode_mem, which, hminB)
end

function CVodeSetMinStepB(cvode_mem, which, hminB)
    CVodeSetMinStepB(cvode_mem, convert(Cint, which), hminB)
end

function CVodeSetMaxStepB(cvode_mem, which::Cint, hmaxB::realtype)
    ccall((:CVodeSetMaxStepB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, realtype), cvode_mem, which, hmaxB)
end

function CVodeSetMaxStepB(cvode_mem, which, hmaxB)
    CVodeSetMaxStepB(cvode_mem, convert(Cint, which), hmaxB)
end

function CVodeSetConstraintsB(cvode_mem, which::Cint, constraintsB::N_Vector)
    ccall((:CVodeSetConstraintsB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, N_Vector), cvode_mem, which, constraintsB)
end

function CVodeSetConstraintsB(cvode_mem, which, constraintsB)
    __constraintsB = convert(NVector, constraintsB)
    CVodeSetConstraintsB(cvode_mem, convert(Cint, which), convert(N_Vector, __constraintsB))
end

function CVodeSetQuadErrConB(cvode_mem, which::Cint, errconQB::Cint)
    ccall((:CVodeSetQuadErrConB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Cint), cvode_mem, which, errconQB)
end

function CVodeSetQuadErrConB(cvode_mem, which, errconQB)
    CVodeSetQuadErrConB(cvode_mem, convert(Cint, which), convert(Cint, errconQB))
end

function CVodeSetNonlinearSolverB(cvode_mem, which::Cint, NLS::SUNNonlinearSolver)
    ccall((:CVodeSetNonlinearSolverB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, SUNNonlinearSolver), cvode_mem, which, NLS)
end

function CVodeSetNonlinearSolverB(cvode_mem, which, NLS)
    CVodeSetNonlinearSolverB(cvode_mem, convert(Cint, which), NLS)
end

function CVodeGetB(cvode_mem, which::Cint, tBret, yB::N_Vector)
    ccall((:CVodeGetB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Ptr{realtype}, N_Vector), cvode_mem, which, tBret, yB)
end

function CVodeGetB(cvode_mem, which, tBret, yB)
    __yB = convert(NVector, yB)
    CVodeGetB(cvode_mem, convert(Cint, which), tBret, convert(N_Vector, __yB))
end

function CVodeGetQuadB(cvode_mem, which::Cint, tBret, qB::N_Vector)
    ccall((:CVodeGetQuadB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Ptr{realtype}, N_Vector), cvode_mem, which, tBret, qB)
end

function CVodeGetQuadB(cvode_mem, which, tBret, qB)
    __qB = convert(NVector, qB)
    CVodeGetQuadB(cvode_mem, convert(Cint, which), tBret, convert(N_Vector, __qB))
end

function CVodeGetAdjCVodeBmem(cvode_mem, which::Cint)
    ccall((:CVodeGetAdjCVodeBmem, libsundials_cvodes), Ptr{Cvoid}, (CVODEMemPtr, Cint), cvode_mem, which)
end

function CVodeGetAdjCVodeBmem(cvode_mem, which)
    CVodeGetAdjCVodeBmem(cvode_mem, convert(Cint, which))
end

function CVodeGetAdjY(cvode_mem, t::realtype, y::N_Vector)
    ccall((:CVodeGetAdjY, libsundials_cvodes), Cint, (CVODEMemPtr, realtype, N_Vector), cvode_mem, t, y)
end

function CVodeGetAdjY(cvode_mem, t, y)
    __y = convert(NVector, y)
    CVodeGetAdjY(cvode_mem, t, convert(N_Vector, __y))
end

function CVodeGetAdjCheckPointsInfo(cvode_mem, ckpnt)
    ccall((:CVodeGetAdjCheckPointsInfo, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{CVadjCheckPointRec}), cvode_mem, ckpnt)
end

function CVodeGetAdjDataPointHermite(cvode_mem, which::Cint, t, y::N_Vector, yd::N_Vector)
    ccall((:CVodeGetAdjDataPointHermite, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Ptr{realtype}, N_Vector, N_Vector), cvode_mem, which, t, y, yd)
end

function CVodeGetAdjDataPointHermite(cvode_mem, which, t, y, yd)
    __y = convert(NVector, y)
    __yd = convert(NVector, yd)
    CVodeGetAdjDataPointHermite(cvode_mem, convert(Cint, which), t, convert(N_Vector, __y), convert(N_Vector, __yd))
end

function CVodeGetAdjDataPointPolynomial(cvode_mem, which::Cint, t, order, y::N_Vector)
    ccall((:CVodeGetAdjDataPointPolynomial, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Ptr{realtype}, Ptr{Cint}, N_Vector), cvode_mem, which, t, order, y)
end

function CVodeGetAdjDataPointPolynomial(cvode_mem, which, t, order, y)
    __y = convert(NVector, y)
    CVodeGetAdjDataPointPolynomial(cvode_mem, convert(Cint, which), t, order, convert(N_Vector, __y))
end

function CVodeGetAdjCurrentCheckPoint(cvode_mem, addr)
    ccall((:CVodeGetAdjCurrentCheckPoint, libsundials_cvodes), Cint, (CVODEMemPtr, Ptr{Ptr{Cvoid}}), cvode_mem, addr)
end

function CVBandPrecInitB(cvode_mem, which::Cint, nB::sunindextype, muB::sunindextype, mlB::sunindextype)
    ccall((:CVBandPrecInitB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, sunindextype, sunindextype, sunindextype), cvode_mem, which, nB, muB, mlB)
end

function CVBandPrecInitB(cvode_mem, which, nB, muB, mlB)
    CVBandPrecInitB(cvode_mem, convert(Cint, which), nB, muB, mlB)
end

function CVBBDPrecInitB(cvode_mem, which::Cint, NlocalB::sunindextype, mudqB::sunindextype, mldqB::sunindextype, mukeepB::sunindextype, mlkeepB::sunindextype, dqrelyB::realtype, glocB::CVLocalFnB, cfnB::CVCommFnB)
    ccall((:CVBBDPrecInitB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, sunindextype, sunindextype, sunindextype, sunindextype, sunindextype, realtype, CVLocalFnB, CVCommFnB), cvode_mem, which, NlocalB, mudqB, mldqB, mukeepB, mlkeepB, dqrelyB, glocB, cfnB)
end

function CVBBDPrecInitB(cvode_mem, which, NlocalB, mudqB, mldqB, mukeepB, mlkeepB, dqrelyB, glocB, cfnB)
    CVBBDPrecInitB(cvode_mem, convert(Cint, which), NlocalB, mudqB, mldqB, mukeepB, mlkeepB, dqrelyB, glocB, cfnB)
end

function CVBBDPrecReInitB(cvode_mem, which::Cint, mudqB::sunindextype, mldqB::sunindextype, dqrelyB::realtype)
    ccall((:CVBBDPrecReInitB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, sunindextype, sunindextype, realtype), cvode_mem, which, mudqB, mldqB, dqrelyB)
end

function CVBBDPrecReInitB(cvode_mem, which, mudqB, mldqB, dqrelyB)
    CVBBDPrecReInitB(cvode_mem, convert(Cint, which), mudqB, mldqB, dqrelyB)
end

function CVDiagB(cvode_mem, which::Cint)
    ccall((:CVDiagB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint), cvode_mem, which)
end

function CVDiagB(cvode_mem, which)
    CVDiagB(cvode_mem, convert(Cint, which))
end

function CVDlsSetLinearSolverB(cvode_mem, which::Cint, LS::SUNLinearSolver, A::SUNMatrix)
    ccall((:CVDlsSetLinearSolverB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, SUNLinearSolver, SUNMatrix), cvode_mem, which, LS, A)
end

function CVDlsSetLinearSolverB(cvode_mem, which, LS, A)
    CVDlsSetLinearSolverB(cvode_mem, convert(Cint, which), LS, A)
end

function CVDlsSetJacFnB(cvode_mem, which::Cint, jacB::CVDlsJacFnB)
    ccall((:CVDlsSetJacFnB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVDlsJacFnB), cvode_mem, which, jacB)
end

function CVDlsSetJacFnB(cvode_mem, which, jacB)
    CVDlsSetJacFnB(cvode_mem, convert(Cint, which), jacB)
end

function CVDlsSetJacFnBS(cvode_mem, which::Cint, jacBS::CVDlsJacFnBS)
    ccall((:CVDlsSetJacFnBS, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVDlsJacFnBS), cvode_mem, which, jacBS)
end

function CVDlsSetJacFnBS(cvode_mem, which, jacBS)
    CVDlsSetJacFnBS(cvode_mem, convert(Cint, which), jacBS)
end

function CVodeSetLinearSolverB(cvode_mem, which::Cint, LS::SUNLinearSolver, A::SUNMatrix)
    ccall((:CVodeSetLinearSolverB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, SUNLinearSolver, SUNMatrix), cvode_mem, which, LS, A)
end

function CVodeSetLinearSolverB(cvode_mem, which, LS, A)
    CVodeSetLinearSolverB(cvode_mem, convert(Cint, which), LS, A)
end

function CVodeSetJacFnB(cvode_mem, which::Cint, jacB::CVLsJacFnB)
    ccall((:CVodeSetJacFnB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVLsJacFnB), cvode_mem, which, jacB)
end

function CVodeSetJacFnB(cvode_mem, which, jacB)
    CVodeSetJacFnB(cvode_mem, convert(Cint, which), jacB)
end

function CVodeSetJacFnBS(cvode_mem, which::Cint, jacBS::CVLsJacFnBS)
    ccall((:CVodeSetJacFnBS, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVLsJacFnBS), cvode_mem, which, jacBS)
end

function CVodeSetJacFnBS(cvode_mem, which, jacBS)
    CVodeSetJacFnBS(cvode_mem, convert(Cint, which), jacBS)
end

function CVodeSetEpsLinB(cvode_mem, which::Cint, eplifacB::realtype)
    ccall((:CVodeSetEpsLinB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, realtype), cvode_mem, which, eplifacB)
end

function CVodeSetEpsLinB(cvode_mem, which, eplifacB)
    CVodeSetEpsLinB(cvode_mem, convert(Cint, which), eplifacB)
end

function CVodeSetLinearSolutionScalingB(cvode_mem, which::Cint, onoffB::Cint)
    ccall((:CVodeSetLinearSolutionScalingB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, Cint), cvode_mem, which, onoffB)
end

function CVodeSetLinearSolutionScalingB(cvode_mem, which, onoffB)
    CVodeSetLinearSolutionScalingB(cvode_mem, convert(Cint, which), convert(Cint, onoffB))
end

function CVodeSetPreconditionerB(cvode_mem, which::Cint, psetB::CVLsPrecSetupFnB, psolveB::CVLsPrecSolveFnB)
    ccall((:CVodeSetPreconditionerB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVLsPrecSetupFnB, CVLsPrecSolveFnB), cvode_mem, which, psetB, psolveB)
end

function CVodeSetPreconditionerB(cvode_mem, which, psetB, psolveB)
    CVodeSetPreconditionerB(cvode_mem, convert(Cint, which), psetB, psolveB)
end

function CVodeSetPreconditionerBS(cvode_mem, which::Cint, psetBS::CVLsPrecSetupFnBS, psolveBS::CVLsPrecSolveFnBS)
    ccall((:CVodeSetPreconditionerBS, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVLsPrecSetupFnBS, CVLsPrecSolveFnBS), cvode_mem, which, psetBS, psolveBS)
end

function CVodeSetPreconditionerBS(cvode_mem, which, psetBS, psolveBS)
    CVodeSetPreconditionerBS(cvode_mem, convert(Cint, which), psetBS, psolveBS)
end

function CVodeSetJacTimesB(cvode_mem, which::Cint, jtsetupB::CVLsJacTimesSetupFnB, jtimesB::CVLsJacTimesVecFnB)
    ccall((:CVodeSetJacTimesB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVLsJacTimesSetupFnB, CVLsJacTimesVecFnB), cvode_mem, which, jtsetupB, jtimesB)
end

function CVodeSetJacTimesB(cvode_mem, which, jtsetupB, jtimesB)
    CVodeSetJacTimesB(cvode_mem, convert(Cint, which), jtsetupB, jtimesB)
end

function CVodeSetJacTimesBS(cvode_mem, which::Cint, jtsetupBS::CVLsJacTimesSetupFnBS, jtimesBS::CVLsJacTimesVecFnBS)
    ccall((:CVodeSetJacTimesBS, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVLsJacTimesSetupFnBS, CVLsJacTimesVecFnBS), cvode_mem, which, jtsetupBS, jtimesBS)
end

function CVodeSetJacTimesBS(cvode_mem, which, jtsetupBS, jtimesBS)
    CVodeSetJacTimesBS(cvode_mem, convert(Cint, which), jtsetupBS, jtimesBS)
end

function CVodeSetLinSysFnB(cvode_mem, which::Cint, linsys::CVLsLinSysFnB)
    ccall((:CVodeSetLinSysFnB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVLsLinSysFnB), cvode_mem, which, linsys)
end

function CVodeSetLinSysFnB(cvode_mem, which, linsys)
    CVodeSetLinSysFnB(cvode_mem, convert(Cint, which), linsys)
end

function CVodeSetLinSysFnBS(cvode_mem, which::Cint, linsys::CVLsLinSysFnBS)
    ccall((:CVodeSetLinSysFnBS, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVLsLinSysFnBS), cvode_mem, which, linsys)
end

function CVodeSetLinSysFnBS(cvode_mem, which, linsys)
    CVodeSetLinSysFnBS(cvode_mem, convert(Cint, which), linsys)
end

function CVSpilsSetLinearSolverB(cvode_mem, which::Cint, LS::SUNLinearSolver)
    ccall((:CVSpilsSetLinearSolverB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, SUNLinearSolver), cvode_mem, which, LS)
end

function CVSpilsSetLinearSolverB(cvode_mem, which, LS)
    CVSpilsSetLinearSolverB(cvode_mem, convert(Cint, which), LS)
end

function CVSpilsSetEpsLinB(cvode_mem, which::Cint, eplifacB::realtype)
    ccall((:CVSpilsSetEpsLinB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, realtype), cvode_mem, which, eplifacB)
end

function CVSpilsSetEpsLinB(cvode_mem, which, eplifacB)
    CVSpilsSetEpsLinB(cvode_mem, convert(Cint, which), eplifacB)
end

function CVSpilsSetPreconditionerB(cvode_mem, which::Cint, psetB::CVSpilsPrecSetupFnB, psolveB::CVSpilsPrecSolveFnB)
    ccall((:CVSpilsSetPreconditionerB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVSpilsPrecSetupFnB, CVSpilsPrecSolveFnB), cvode_mem, which, psetB, psolveB)
end

function CVSpilsSetPreconditionerB(cvode_mem, which, psetB, psolveB)
    CVSpilsSetPreconditionerB(cvode_mem, convert(Cint, which), psetB, psolveB)
end

function CVSpilsSetPreconditionerBS(cvode_mem, which::Cint, psetBS::CVSpilsPrecSetupFnBS, psolveBS::CVSpilsPrecSolveFnBS)
    ccall((:CVSpilsSetPreconditionerBS, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVSpilsPrecSetupFnBS, CVSpilsPrecSolveFnBS), cvode_mem, which, psetBS, psolveBS)
end

function CVSpilsSetPreconditionerBS(cvode_mem, which, psetBS, psolveBS)
    CVSpilsSetPreconditionerBS(cvode_mem, convert(Cint, which), psetBS, psolveBS)
end

function CVSpilsSetJacTimesB(cvode_mem, which::Cint, jtsetupB::CVSpilsJacTimesSetupFnB, jtimesB::CVSpilsJacTimesVecFnB)
    ccall((:CVSpilsSetJacTimesB, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVSpilsJacTimesSetupFnB, CVSpilsJacTimesVecFnB), cvode_mem, which, jtsetupB, jtimesB)
end

function CVSpilsSetJacTimesB(cvode_mem, which, jtsetupB, jtimesB)
    CVSpilsSetJacTimesB(cvode_mem, convert(Cint, which), jtsetupB, jtimesB)
end

function CVSpilsSetJacTimesBS(cvode_mem, which::Cint, jtsetupBS::CVSpilsJacTimesSetupFnBS, jtimesBS::CVSpilsJacTimesVecFnBS)
    ccall((:CVSpilsSetJacTimesBS, libsundials_cvodes), Cint, (CVODEMemPtr, Cint, CVSpilsJacTimesSetupFnBS, CVSpilsJacTimesVecFnBS), cvode_mem, which, jtsetupBS, jtimesBS)
end

function CVSpilsSetJacTimesBS(cvode_mem, which, jtsetupBS, jtimesBS)
    CVSpilsSetJacTimesBS(cvode_mem, convert(Cint, which), jtsetupBS, jtimesBS)
end

function IDACreate()
    ccall((:IDACreate, libsundials_idas), IDAMemPtr, ())
end

function IDAInit(ida_mem, res::IDAResFn, t0::realtype, yy0::N_Vector, yp0::N_Vector)
    ccall((:IDAInit, libsundials_idas), Cint, (IDAMemPtr, IDAResFn, realtype, N_Vector, N_Vector), ida_mem, res, t0, yy0, yp0)
end

function IDAInit(ida_mem, res, t0, yy0, yp0)
    __yy0 = convert(NVector, yy0)
    __yp0 = convert(NVector, yp0)
    IDAInit(ida_mem, IDAResFn_wrapper(res), t0, convert(N_Vector, __yy0), convert(N_Vector, __yp0))
end

function IDAReInit(ida_mem, t0::realtype, yy0::N_Vector, yp0::N_Vector)
    ccall((:IDAReInit, libsundials_idas), Cint, (IDAMemPtr, realtype, N_Vector, N_Vector), ida_mem, t0, yy0, yp0)
end

function IDAReInit(ida_mem, t0, yy0, yp0)
    __yy0 = convert(NVector, yy0)
    __yp0 = convert(NVector, yp0)
    IDAReInit(ida_mem, t0, convert(N_Vector, __yy0), convert(N_Vector, __yp0))
end

function IDASStolerances(ida_mem, reltol::realtype, abstol::realtype)
    ccall((:IDASStolerances, libsundials_idas), Cint, (IDAMemPtr, realtype, realtype), ida_mem, reltol, abstol)
end

function IDASVtolerances(ida_mem, reltol::realtype, abstol::N_Vector)
    ccall((:IDASVtolerances, libsundials_idas), Cint, (IDAMemPtr, realtype, N_Vector), ida_mem, reltol, abstol)
end

function IDASVtolerances(ida_mem, reltol, abstol)
    __abstol = convert(NVector, abstol)
    IDASVtolerances(ida_mem, reltol, convert(N_Vector, __abstol))
end

function IDAWFtolerances(ida_mem, efun::IDAEwtFn)
    ccall((:IDAWFtolerances, libsundials_idas), Cint, (IDAMemPtr, IDAEwtFn), ida_mem, efun)
end

function IDACalcIC(ida_mem, icopt::Cint, tout1::realtype)
    ccall((:IDACalcIC, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype), ida_mem, icopt, tout1)
end

function IDACalcIC(ida_mem, icopt, tout1)
    IDACalcIC(ida_mem, convert(Cint, icopt), tout1)
end

function IDASetNonlinConvCoefIC(ida_mem, epiccon::realtype)
    ccall((:IDASetNonlinConvCoefIC, libsundials_idas), Cint, (IDAMemPtr, realtype), ida_mem, epiccon)
end

function IDASetMaxNumStepsIC(ida_mem, maxnh::Cint)
    ccall((:IDASetMaxNumStepsIC, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, maxnh)
end

function IDASetMaxNumStepsIC(ida_mem, maxnh)
    IDASetMaxNumStepsIC(ida_mem, convert(Cint, maxnh))
end

function IDASetMaxNumJacsIC(ida_mem, maxnj::Cint)
    ccall((:IDASetMaxNumJacsIC, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, maxnj)
end

function IDASetMaxNumJacsIC(ida_mem, maxnj)
    IDASetMaxNumJacsIC(ida_mem, convert(Cint, maxnj))
end

function IDASetMaxNumItersIC(ida_mem, maxnit::Cint)
    ccall((:IDASetMaxNumItersIC, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, maxnit)
end

function IDASetMaxNumItersIC(ida_mem, maxnit)
    IDASetMaxNumItersIC(ida_mem, convert(Cint, maxnit))
end

function IDASetLineSearchOffIC(ida_mem, lsoff::Cint)
    ccall((:IDASetLineSearchOffIC, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, lsoff)
end

function IDASetLineSearchOffIC(ida_mem, lsoff)
    IDASetLineSearchOffIC(ida_mem, convert(Cint, lsoff))
end

function IDASetStepToleranceIC(ida_mem, steptol::realtype)
    ccall((:IDASetStepToleranceIC, libsundials_idas), Cint, (IDAMemPtr, realtype), ida_mem, steptol)
end

function IDASetMaxBacksIC(ida_mem, maxbacks::Cint)
    ccall((:IDASetMaxBacksIC, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, maxbacks)
end

function IDASetMaxBacksIC(ida_mem, maxbacks)
    IDASetMaxBacksIC(ida_mem, convert(Cint, maxbacks))
end

function IDASetErrHandlerFn(ida_mem, ehfun::IDAErrHandlerFn, eh_data)
    ccall((:IDASetErrHandlerFn, libsundials_idas), Cint, (IDAMemPtr, IDAErrHandlerFn, Ptr{Cvoid}), ida_mem, ehfun, eh_data)
end

function IDASetErrFile(ida_mem, errfp)
    ccall((:IDASetErrFile, libsundials_idas), Cint, (IDAMemPtr, Ptr{Libc.FILE}), ida_mem, errfp)
end

function IDASetUserData(ida_mem, user_data)
    ccall((:IDASetUserData, libsundials_idas), Cint, (IDAMemPtr, Any), ida_mem, user_data)
end

function IDASetMaxOrd(ida_mem, maxord::Cint)
    ccall((:IDASetMaxOrd, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, maxord)
end

function IDASetMaxOrd(ida_mem, maxord)
    IDASetMaxOrd(ida_mem, convert(Cint, maxord))
end

function IDASetMaxNumSteps(ida_mem, mxsteps::Clong)
    ccall((:IDASetMaxNumSteps, libsundials_idas), Cint, (IDAMemPtr, Clong), ida_mem, mxsteps)
end

function IDASetMaxNumSteps(ida_mem, mxsteps)
    IDASetMaxNumSteps(ida_mem, convert(Clong, mxsteps))
end

function IDASetInitStep(ida_mem, hin::realtype)
    ccall((:IDASetInitStep, libsundials_idas), Cint, (IDAMemPtr, realtype), ida_mem, hin)
end

function IDASetMaxStep(ida_mem, hmax::realtype)
    ccall((:IDASetMaxStep, libsundials_idas), Cint, (IDAMemPtr, realtype), ida_mem, hmax)
end

function IDASetStopTime(ida_mem, tstop::realtype)
    ccall((:IDASetStopTime, libsundials_idas), Cint, (IDAMemPtr, realtype), ida_mem, tstop)
end

function IDASetNonlinConvCoef(ida_mem, epcon::realtype)
    ccall((:IDASetNonlinConvCoef, libsundials_idas), Cint, (IDAMemPtr, realtype), ida_mem, epcon)
end

function IDASetMaxErrTestFails(ida_mem, maxnef::Cint)
    ccall((:IDASetMaxErrTestFails, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, maxnef)
end

function IDASetMaxErrTestFails(ida_mem, maxnef)
    IDASetMaxErrTestFails(ida_mem, convert(Cint, maxnef))
end

function IDASetMaxNonlinIters(ida_mem, maxcor::Cint)
    ccall((:IDASetMaxNonlinIters, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, maxcor)
end

function IDASetMaxNonlinIters(ida_mem, maxcor)
    IDASetMaxNonlinIters(ida_mem, convert(Cint, maxcor))
end

function IDASetMaxConvFails(ida_mem, maxncf::Cint)
    ccall((:IDASetMaxConvFails, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, maxncf)
end

function IDASetMaxConvFails(ida_mem, maxncf)
    IDASetMaxConvFails(ida_mem, convert(Cint, maxncf))
end

function IDASetSuppressAlg(ida_mem, suppressalg::Cint)
    ccall((:IDASetSuppressAlg, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, suppressalg)
end

function IDASetSuppressAlg(ida_mem, suppressalg)
    IDASetSuppressAlg(ida_mem, convert(Cint, suppressalg))
end

function IDASetId(ida_mem, id::N_Vector)
    ccall((:IDASetId, libsundials_idas), Cint, (IDAMemPtr, N_Vector), ida_mem, id)
end

function IDASetId(ida_mem, id)
    __id = convert(NVector, id)
    IDASetId(ida_mem, convert(N_Vector, __id))
end

function IDASetConstraints(ida_mem, constraints::N_Vector)
    ccall((:IDASetConstraints, libsundials_idas), Cint, (IDAMemPtr, N_Vector), ida_mem, constraints)
end

function IDASetConstraints(ida_mem, constraints)
    __constraints = convert(NVector, constraints)
    IDASetConstraints(ida_mem, convert(N_Vector, __constraints))
end

function IDASetNonlinearSolver(ida_mem, NLS::SUNNonlinearSolver)
    ccall((:IDASetNonlinearSolver, libsundials_idas), Cint, (IDAMemPtr, SUNNonlinearSolver), ida_mem, NLS)
end

function IDARootInit(ida_mem, nrtfn::Cint, g::IDARootFn)
    ccall((:IDARootInit, libsundials_idas), Cint, (IDAMemPtr, Cint, IDARootFn), ida_mem, nrtfn, g)
end

function IDARootInit(ida_mem, nrtfn, g)
    IDARootInit(ida_mem, convert(Cint, nrtfn), IDARootFn_wrapper(g))
end

function IDASetRootDirection(ida_mem, rootdir)
    ccall((:IDASetRootDirection, libsundials_idas), Cint, (IDAMemPtr, Ptr{Cint}), ida_mem, rootdir)
end

function IDASetNoInactiveRootWarn(ida_mem)
    ccall((:IDASetNoInactiveRootWarn, libsundials_idas), Cint, (IDAMemPtr,), ida_mem)
end

function IDASolve(ida_mem, tout::realtype, tret, yret::N_Vector, ypret::N_Vector, itask::Cint)
    ccall((:IDASolve, libsundials_idas), Cint, (IDAMemPtr, realtype, Ptr{realtype}, N_Vector, N_Vector, Cint), ida_mem, tout, tret, yret, ypret, itask)
end

function IDASolve(ida_mem, tout, tret, yret, ypret, itask)
    __yret = convert(NVector, yret)
    __ypret = convert(NVector, ypret)
    IDASolve(ida_mem, tout, tret, convert(N_Vector, __yret), convert(N_Vector, __ypret), convert(Cint, itask))
end

function IDAComputeY(ida_mem, ycor::N_Vector, y::N_Vector)
    ccall((:IDAComputeY, libsundials_idas), Cint, (IDAMemPtr, N_Vector, N_Vector), ida_mem, ycor, y)
end

function IDAComputeY(ida_mem, ycor, y)
    __ycor = convert(NVector, ycor)
    __y = convert(NVector, y)
    IDAComputeY(ida_mem, convert(N_Vector, __ycor), convert(N_Vector, __y))
end

function IDAComputeYp(ida_mem, ycor::N_Vector, yp::N_Vector)
    ccall((:IDAComputeYp, libsundials_idas), Cint, (IDAMemPtr, N_Vector, N_Vector), ida_mem, ycor, yp)
end

function IDAComputeYp(ida_mem, ycor, yp)
    __ycor = convert(NVector, ycor)
    __yp = convert(NVector, yp)
    IDAComputeYp(ida_mem, convert(N_Vector, __ycor), convert(N_Vector, __yp))
end

function IDAGetDky(ida_mem, t::realtype, k::Cint, dky::N_Vector)
    ccall((:IDAGetDky, libsundials_idas), Cint, (IDAMemPtr, realtype, Cint, N_Vector), ida_mem, t, k, dky)
end

function IDAGetDky(ida_mem, t, k, dky)
    __dky = convert(NVector, dky)
    IDAGetDky(ida_mem, t, convert(Cint, k), convert(N_Vector, __dky))
end

function IDAGetWorkSpace(ida_mem, lenrw, leniw)
    ccall((:IDAGetWorkSpace, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}, Ptr{Clong}), ida_mem, lenrw, leniw)
end

function IDAGetNumSteps(ida_mem, nsteps)
    ccall((:IDAGetNumSteps, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nsteps)
end

function IDAGetNumResEvals(ida_mem, nrevals)
    ccall((:IDAGetNumResEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nrevals)
end

function IDAGetNumLinSolvSetups(ida_mem, nlinsetups)
    ccall((:IDAGetNumLinSolvSetups, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nlinsetups)
end

function IDAGetNumErrTestFails(ida_mem, netfails)
    ccall((:IDAGetNumErrTestFails, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, netfails)
end

function IDAGetNumBacktrackOps(ida_mem, nbacktr)
    ccall((:IDAGetNumBacktrackOps, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nbacktr)
end

function IDAGetConsistentIC(ida_mem, yy0_mod::N_Vector, yp0_mod::N_Vector)
    ccall((:IDAGetConsistentIC, libsundials_idas), Cint, (IDAMemPtr, N_Vector, N_Vector), ida_mem, yy0_mod, yp0_mod)
end

function IDAGetConsistentIC(ida_mem, yy0_mod, yp0_mod)
    __yy0_mod = convert(NVector, yy0_mod)
    __yp0_mod = convert(NVector, yp0_mod)
    IDAGetConsistentIC(ida_mem, convert(N_Vector, __yy0_mod), convert(N_Vector, __yp0_mod))
end

function IDAGetLastOrder(ida_mem, klast)
    ccall((:IDAGetLastOrder, libsundials_idas), Cint, (IDAMemPtr, Ptr{Cint}), ida_mem, klast)
end

function IDAGetCurrentOrder(ida_mem, kcur)
    ccall((:IDAGetCurrentOrder, libsundials_idas), Cint, (IDAMemPtr, Ptr{Cint}), ida_mem, kcur)
end

function IDAGetCurrentCj(ida_mem, cj)
    ccall((:IDAGetCurrentCj, libsundials_idas), Cint, (IDAMemPtr, Ptr{realtype}), ida_mem, cj)
end

function IDAGetCurrentY(ida_mem, ycur)
    ccall((:IDAGetCurrentY, libsundials_idas), Cint, (IDAMemPtr, Ptr{N_Vector}), ida_mem, ycur)
end

function IDAGetCurrentYp(ida_mem, ypcur)
    ccall((:IDAGetCurrentYp, libsundials_idas), Cint, (IDAMemPtr, Ptr{N_Vector}), ida_mem, ypcur)
end

function IDAGetActualInitStep(ida_mem, hinused)
    ccall((:IDAGetActualInitStep, libsundials_idas), Cint, (IDAMemPtr, Ptr{realtype}), ida_mem, hinused)
end

function IDAGetLastStep(ida_mem, hlast)
    ccall((:IDAGetLastStep, libsundials_idas), Cint, (IDAMemPtr, Ptr{realtype}), ida_mem, hlast)
end

function IDAGetCurrentStep(ida_mem, hcur)
    ccall((:IDAGetCurrentStep, libsundials_idas), Cint, (IDAMemPtr, Ptr{realtype}), ida_mem, hcur)
end

function IDAGetCurrentTime(ida_mem, tcur)
    ccall((:IDAGetCurrentTime, libsundials_idas), Cint, (IDAMemPtr, Ptr{realtype}), ida_mem, tcur)
end

function IDAGetTolScaleFactor(ida_mem, tolsfact)
    ccall((:IDAGetTolScaleFactor, libsundials_idas), Cint, (IDAMemPtr, Ptr{realtype}), ida_mem, tolsfact)
end

function IDAGetErrWeights(ida_mem, eweight::N_Vector)
    ccall((:IDAGetErrWeights, libsundials_idas), Cint, (IDAMemPtr, N_Vector), ida_mem, eweight)
end

function IDAGetErrWeights(ida_mem, eweight)
    __eweight = convert(NVector, eweight)
    IDAGetErrWeights(ida_mem, convert(N_Vector, __eweight))
end

function IDAGetEstLocalErrors(ida_mem, ele::N_Vector)
    ccall((:IDAGetEstLocalErrors, libsundials_idas), Cint, (IDAMemPtr, N_Vector), ida_mem, ele)
end

function IDAGetEstLocalErrors(ida_mem, ele)
    __ele = convert(NVector, ele)
    IDAGetEstLocalErrors(ida_mem, convert(N_Vector, __ele))
end

function IDAGetNumGEvals(ida_mem, ngevals)
    ccall((:IDAGetNumGEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, ngevals)
end

function IDAGetRootInfo(ida_mem, rootsfound)
    ccall((:IDAGetRootInfo, libsundials_idas), Cint, (IDAMemPtr, Ptr{Cint}), ida_mem, rootsfound)
end

function IDAGetIntegratorStats(ida_mem, nsteps, nrevals, nlinsetups, netfails, qlast, qcur, hinused, hlast, hcur, tcur)
    ccall((:IDAGetIntegratorStats, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Cint}, Ptr{Cint}, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}), ida_mem, nsteps, nrevals, nlinsetups, netfails, qlast, qcur, hinused, hlast, hcur, tcur)
end

function IDAGetNumNonlinSolvIters(ida_mem, nniters)
    ccall((:IDAGetNumNonlinSolvIters, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nniters)
end

function IDAGetNumNonlinSolvConvFails(ida_mem, nncfails)
    ccall((:IDAGetNumNonlinSolvConvFails, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nncfails)
end

function IDAGetNonlinSolvStats(ida_mem, nniters, nncfails)
    ccall((:IDAGetNonlinSolvStats, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}, Ptr{Clong}), ida_mem, nniters, nncfails)
end

function IDAGetReturnFlagName(flag::Clong)
    ccall((:IDAGetReturnFlagName, libsundials_idas), Cstring, (Clong,), flag)
end

function IDAGetReturnFlagName(flag)
    IDAGetReturnFlagName(convert(Clong, flag))
end

function IDAFree(ida_mem)
    ccall((:IDAFree, libsundials_idas), Cvoid, (Ref{IDAMemPtr},), ida_mem)
end

function IDABBDPrecInit(ida_mem, Nlocal::sunindextype, mudq::sunindextype, mldq::sunindextype, mukeep::sunindextype, mlkeep::sunindextype, dq_rel_yy::realtype, Gres::IDABBDLocalFn, Gcomm::IDABBDCommFn)
    ccall((:IDABBDPrecInit, libsundials_idas), Cint, (IDAMemPtr, sunindextype, sunindextype, sunindextype, sunindextype, sunindextype, realtype, IDABBDLocalFn, IDABBDCommFn), ida_mem, Nlocal, mudq, mldq, mukeep, mlkeep, dq_rel_yy, Gres, Gcomm)
end

function IDABBDPrecReInit(ida_mem, mudq::sunindextype, mldq::sunindextype, dq_rel_yy::realtype)
    ccall((:IDABBDPrecReInit, libsundials_idas), Cint, (IDAMemPtr, sunindextype, sunindextype, realtype), ida_mem, mudq, mldq, dq_rel_yy)
end

function IDABBDPrecGetWorkSpace(ida_mem, lenrwBBDP, leniwBBDP)
    ccall((:IDABBDPrecGetWorkSpace, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}, Ptr{Clong}), ida_mem, lenrwBBDP, leniwBBDP)
end

function IDABBDPrecGetNumGfnEvals(ida_mem, ngevalsBBDP)
    ccall((:IDABBDPrecGetNumGfnEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, ngevalsBBDP)
end

function IDADlsSetLinearSolver(ida_mem, LS::SUNLinearSolver, A::SUNMatrix)
    ccall((:IDADlsSetLinearSolver, libsundials_idas), Cint, (IDAMemPtr, SUNLinearSolver, SUNMatrix), ida_mem, LS, A)
end

function IDADlsSetJacFn(ida_mem, jac::IDADlsJacFn)
    ccall((:IDADlsSetJacFn, libsundials_idas), Cint, (IDAMemPtr, IDADlsJacFn), ida_mem, jac)
end

function IDADlsGetWorkSpace(ida_mem, lenrwLS, leniwLS)
    ccall((:IDADlsGetWorkSpace, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}, Ptr{Clong}), ida_mem, lenrwLS, leniwLS)
end

function IDADlsGetNumJacEvals(ida_mem, njevals)
    ccall((:IDADlsGetNumJacEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, njevals)
end

function IDADlsGetNumResEvals(ida_mem, nrevalsLS)
    ccall((:IDADlsGetNumResEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nrevalsLS)
end

function IDADlsGetLastFlag(ida_mem, flag)
    ccall((:IDADlsGetLastFlag, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, flag)
end

function IDADlsGetReturnFlagName(flag::Clong)
    ccall((:IDADlsGetReturnFlagName, libsundials_idas), Cstring, (Clong,), flag)
end

function IDADlsGetReturnFlagName(flag)
    IDADlsGetReturnFlagName(convert(Clong, flag))
end

function IDASetLinearSolver(ida_mem, LS::SUNLinearSolver, A::SUNMatrix)
    ccall((:IDASetLinearSolver, libsundials_idas), Cint, (IDAMemPtr, SUNLinearSolver, SUNMatrix), ida_mem, LS, A)
end

function IDASetJacFn(ida_mem, jac::IDALsJacFn)
    ccall((:IDASetJacFn, libsundials_idas), Cint, (IDAMemPtr, IDALsJacFn), ida_mem, jac)
end

function IDASetPreconditioner(ida_mem, pset::IDALsPrecSetupFn, psolve::IDALsPrecSolveFn)
    ccall((:IDASetPreconditioner, libsundials_idas), Cint, (IDAMemPtr, IDALsPrecSetupFn, IDALsPrecSolveFn), ida_mem, pset, psolve)
end

function IDASetJacTimes(ida_mem, jtsetup::IDALsJacTimesSetupFn, jtimes::IDALsJacTimesVecFn)
    ccall((:IDASetJacTimes, libsundials_idas), Cint, (IDAMemPtr, IDALsJacTimesSetupFn, IDALsJacTimesVecFn), ida_mem, jtsetup, jtimes)
end

function IDASetEpsLin(ida_mem, eplifac::realtype)
    ccall((:IDASetEpsLin, libsundials_idas), Cint, (IDAMemPtr, realtype), ida_mem, eplifac)
end

function IDASetLinearSolutionScaling(ida_mem, onoff::Cint)
    ccall((:IDASetLinearSolutionScaling, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, onoff)
end

function IDASetLinearSolutionScaling(ida_mem, onoff)
    IDASetLinearSolutionScaling(ida_mem, convert(Cint, onoff))
end

function IDASetIncrementFactor(ida_mem, dqincfac::realtype)
    ccall((:IDASetIncrementFactor, libsundials_idas), Cint, (IDAMemPtr, realtype), ida_mem, dqincfac)
end

function IDAGetLinWorkSpace(ida_mem, lenrwLS, leniwLS)
    ccall((:IDAGetLinWorkSpace, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}, Ptr{Clong}), ida_mem, lenrwLS, leniwLS)
end

function IDAGetNumJacEvals(ida_mem, njevals)
    ccall((:IDAGetNumJacEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, njevals)
end

function IDAGetNumPrecEvals(ida_mem, npevals)
    ccall((:IDAGetNumPrecEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, npevals)
end

function IDAGetNumPrecSolves(ida_mem, npsolves)
    ccall((:IDAGetNumPrecSolves, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, npsolves)
end

function IDAGetNumLinIters(ida_mem, nliters)
    ccall((:IDAGetNumLinIters, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nliters)
end

function IDAGetNumLinConvFails(ida_mem, nlcfails)
    ccall((:IDAGetNumLinConvFails, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nlcfails)
end

function IDAGetNumJTSetupEvals(ida_mem, njtsetups)
    ccall((:IDAGetNumJTSetupEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, njtsetups)
end

function IDAGetNumJtimesEvals(ida_mem, njvevals)
    ccall((:IDAGetNumJtimesEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, njvevals)
end

function IDAGetNumLinResEvals(ida_mem, nrevalsLS)
    ccall((:IDAGetNumLinResEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nrevalsLS)
end

function IDAGetLastLinFlag(ida_mem, flag)
    ccall((:IDAGetLastLinFlag, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, flag)
end

function IDAGetLinReturnFlagName(flag::Clong)
    ccall((:IDAGetLinReturnFlagName, libsundials_idas), Cstring, (Clong,), flag)
end

function IDAGetLinReturnFlagName(flag)
    IDAGetLinReturnFlagName(convert(Clong, flag))
end

function IDASpilsSetLinearSolver(ida_mem, LS::SUNLinearSolver)
    ccall((:IDASpilsSetLinearSolver, libsundials_idas), Cint, (IDAMemPtr, SUNLinearSolver), ida_mem, LS)
end

function IDASpilsSetPreconditioner(ida_mem, pset::IDASpilsPrecSetupFn, psolve::IDASpilsPrecSolveFn)
    ccall((:IDASpilsSetPreconditioner, libsundials_idas), Cint, (IDAMemPtr, IDASpilsPrecSetupFn, IDASpilsPrecSolveFn), ida_mem, pset, psolve)
end

function IDASpilsSetJacTimes(ida_mem, jtsetup::IDASpilsJacTimesSetupFn, jtimes::IDASpilsJacTimesVecFn)
    ccall((:IDASpilsSetJacTimes, libsundials_idas), Cint, (IDAMemPtr, IDASpilsJacTimesSetupFn, IDASpilsJacTimesVecFn), ida_mem, jtsetup, jtimes)
end

function IDASpilsSetEpsLin(ida_mem, eplifac::realtype)
    ccall((:IDASpilsSetEpsLin, libsundials_idas), Cint, (IDAMemPtr, realtype), ida_mem, eplifac)
end

function IDASpilsSetIncrementFactor(ida_mem, dqincfac::realtype)
    ccall((:IDASpilsSetIncrementFactor, libsundials_idas), Cint, (IDAMemPtr, realtype), ida_mem, dqincfac)
end

function IDASpilsGetWorkSpace(ida_mem, lenrwLS, leniwLS)
    ccall((:IDASpilsGetWorkSpace, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}, Ptr{Clong}), ida_mem, lenrwLS, leniwLS)
end

function IDASpilsGetNumPrecEvals(ida_mem, npevals)
    ccall((:IDASpilsGetNumPrecEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, npevals)
end

function IDASpilsGetNumPrecSolves(ida_mem, npsolves)
    ccall((:IDASpilsGetNumPrecSolves, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, npsolves)
end

function IDASpilsGetNumLinIters(ida_mem, nliters)
    ccall((:IDASpilsGetNumLinIters, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nliters)
end

function IDASpilsGetNumConvFails(ida_mem, nlcfails)
    ccall((:IDASpilsGetNumConvFails, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nlcfails)
end

function IDASpilsGetNumJTSetupEvals(ida_mem, njtsetups)
    ccall((:IDASpilsGetNumJTSetupEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, njtsetups)
end

function IDASpilsGetNumJtimesEvals(ida_mem, njvevals)
    ccall((:IDASpilsGetNumJtimesEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, njvevals)
end

function IDASpilsGetNumResEvals(ida_mem, nrevalsLS)
    ccall((:IDASpilsGetNumResEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nrevalsLS)
end

function IDASpilsGetLastFlag(ida_mem, flag)
    ccall((:IDASpilsGetLastFlag, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, flag)
end

function IDASpilsGetReturnFlagName(flag::Clong)
    ccall((:IDASpilsGetReturnFlagName, libsundials_idas), Cstring, (Clong,), flag)
end

function IDASpilsGetReturnFlagName(flag)
    IDASpilsGetReturnFlagName(convert(Clong, flag))
end

function IDAComputeYSens(ida_mem, ycor, yyS)
    ccall((:IDAComputeYSens, libsundials_idas), Cint, (IDAMemPtr, Ptr{N_Vector}, Ptr{N_Vector}), ida_mem, ycor, yyS)
end

function IDAComputeYpSens(ida_mem, ycor, ypS)
    ccall((:IDAComputeYpSens, libsundials_idas), Cint, (IDAMemPtr, Ptr{N_Vector}, Ptr{N_Vector}), ida_mem, ycor, ypS)
end

function IDAGetCurrentYSens(ida_mem, yS)
    ccall((:IDAGetCurrentYSens, libsundials_idas), Cint, (IDAMemPtr, Ptr{Ptr{N_Vector}}), ida_mem, yS)
end

function IDAGetCurrentYpSens(ida_mem, ypS)
    ccall((:IDAGetCurrentYpSens, libsundials_idas), Cint, (IDAMemPtr, Ptr{Ptr{N_Vector}}), ida_mem, ypS)
end

function IDAQuadInit(ida_mem, rhsQ::IDAQuadRhsFn, yQ0::N_Vector)
    ccall((:IDAQuadInit, libsundials_idas), Cint, (IDAMemPtr, IDAQuadRhsFn, N_Vector), ida_mem, rhsQ, yQ0)
end

function IDAQuadInit(ida_mem, rhsQ, yQ0)
    __yQ0 = convert(NVector, yQ0)
    IDAQuadInit(ida_mem, rhsQ, convert(N_Vector, __yQ0))
end

function IDAQuadReInit(ida_mem, yQ0::N_Vector)
    ccall((:IDAQuadReInit, libsundials_idas), Cint, (IDAMemPtr, N_Vector), ida_mem, yQ0)
end

function IDAQuadReInit(ida_mem, yQ0)
    __yQ0 = convert(NVector, yQ0)
    IDAQuadReInit(ida_mem, convert(N_Vector, __yQ0))
end

function IDAQuadSStolerances(ida_mem, reltolQ::realtype, abstolQ::realtype)
    ccall((:IDAQuadSStolerances, libsundials_idas), Cint, (IDAMemPtr, realtype, realtype), ida_mem, reltolQ, abstolQ)
end

function IDAQuadSVtolerances(ida_mem, reltolQ::realtype, abstolQ::N_Vector)
    ccall((:IDAQuadSVtolerances, libsundials_idas), Cint, (IDAMemPtr, realtype, N_Vector), ida_mem, reltolQ, abstolQ)
end

function IDAQuadSVtolerances(ida_mem, reltolQ, abstolQ)
    __abstolQ = convert(NVector, abstolQ)
    IDAQuadSVtolerances(ida_mem, reltolQ, convert(N_Vector, __abstolQ))
end

function IDASetQuadErrCon(ida_mem, errconQ::Cint)
    ccall((:IDASetQuadErrCon, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, errconQ)
end

function IDASetQuadErrCon(ida_mem, errconQ)
    IDASetQuadErrCon(ida_mem, convert(Cint, errconQ))
end

function IDAGetQuad(ida_mem, t, yQout::N_Vector)
    ccall((:IDAGetQuad, libsundials_idas), Cint, (IDAMemPtr, Ptr{realtype}, N_Vector), ida_mem, t, yQout)
end

function IDAGetQuad(ida_mem, t, yQout)
    __yQout = convert(NVector, yQout)
    IDAGetQuad(ida_mem, t, convert(N_Vector, __yQout))
end

function IDAGetQuadDky(ida_mem, t::realtype, k::Cint, dky::N_Vector)
    ccall((:IDAGetQuadDky, libsundials_idas), Cint, (IDAMemPtr, realtype, Cint, N_Vector), ida_mem, t, k, dky)
end

function IDAGetQuadDky(ida_mem, t, k, dky)
    __dky = convert(NVector, dky)
    IDAGetQuadDky(ida_mem, t, convert(Cint, k), convert(N_Vector, __dky))
end

function IDAGetQuadNumRhsEvals(ida_mem, nrhsQevals)
    ccall((:IDAGetQuadNumRhsEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nrhsQevals)
end

function IDAGetQuadNumErrTestFails(ida_mem, nQetfails)
    ccall((:IDAGetQuadNumErrTestFails, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nQetfails)
end

function IDAGetQuadErrWeights(ida_mem, eQweight::N_Vector)
    ccall((:IDAGetQuadErrWeights, libsundials_idas), Cint, (IDAMemPtr, N_Vector), ida_mem, eQweight)
end

function IDAGetQuadErrWeights(ida_mem, eQweight)
    __eQweight = convert(NVector, eQweight)
    IDAGetQuadErrWeights(ida_mem, convert(N_Vector, __eQweight))
end

function IDAGetQuadStats(ida_mem, nrhsQevals, nQetfails)
    ccall((:IDAGetQuadStats, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}, Ptr{Clong}), ida_mem, nrhsQevals, nQetfails)
end

function IDAQuadFree(ida_mem)
    ccall((:IDAQuadFree, libsundials_idas), Cvoid, (IDAMemPtr,), ida_mem)
end

function IDASensInit(ida_mem, Ns::Cint, ism::Cint, resS::IDASensResFn, yS0, ypS0)
    ccall((:IDASensInit, libsundials_idas), Cint, (IDAMemPtr, Cint, Cint, IDASensResFn, Ptr{N_Vector}, Ptr{N_Vector}), ida_mem, Ns, ism, resS, yS0, ypS0)
end

function IDASensInit(ida_mem, Ns, ism, resS, yS0, ypS0)
    IDASensInit(ida_mem, convert(Cint, Ns), convert(Cint, ism), resS, yS0, ypS0)
end

function IDASensReInit(ida_mem, ism::Cint, yS0, ypS0)
    ccall((:IDASensReInit, libsundials_idas), Cint, (IDAMemPtr, Cint, Ptr{N_Vector}, Ptr{N_Vector}), ida_mem, ism, yS0, ypS0)
end

function IDASensReInit(ida_mem, ism, yS0, ypS0)
    IDASensReInit(ida_mem, convert(Cint, ism), yS0, ypS0)
end

function IDASensSStolerances(ida_mem, reltolS::realtype, abstolS)
    ccall((:IDASensSStolerances, libsundials_idas), Cint, (IDAMemPtr, realtype, Ptr{realtype}), ida_mem, reltolS, abstolS)
end

function IDASensSVtolerances(ida_mem, reltolS::realtype, abstolS)
    ccall((:IDASensSVtolerances, libsundials_idas), Cint, (IDAMemPtr, realtype, Ptr{N_Vector}), ida_mem, reltolS, abstolS)
end

function IDASensEEtolerances(ida_mem)
    ccall((:IDASensEEtolerances, libsundials_idas), Cint, (IDAMemPtr,), ida_mem)
end

function IDAGetSensConsistentIC(ida_mem, yyS0, ypS0)
    ccall((:IDAGetSensConsistentIC, libsundials_idas), Cint, (IDAMemPtr, Ptr{N_Vector}, Ptr{N_Vector}), ida_mem, yyS0, ypS0)
end

function IDASetSensDQMethod(ida_mem, DQtype::Cint, DQrhomax::realtype)
    ccall((:IDASetSensDQMethod, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype), ida_mem, DQtype, DQrhomax)
end

function IDASetSensDQMethod(ida_mem, DQtype, DQrhomax)
    IDASetSensDQMethod(ida_mem, convert(Cint, DQtype), DQrhomax)
end

function IDASetSensErrCon(ida_mem, errconS::Cint)
    ccall((:IDASetSensErrCon, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, errconS)
end

function IDASetSensErrCon(ida_mem, errconS)
    IDASetSensErrCon(ida_mem, convert(Cint, errconS))
end

function IDASetSensMaxNonlinIters(ida_mem, maxcorS::Cint)
    ccall((:IDASetSensMaxNonlinIters, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, maxcorS)
end

function IDASetSensMaxNonlinIters(ida_mem, maxcorS)
    IDASetSensMaxNonlinIters(ida_mem, convert(Cint, maxcorS))
end

function IDASetSensParams(ida_mem, p, pbar, plist)
    ccall((:IDASetSensParams, libsundials_idas), Cint, (IDAMemPtr, Ptr{realtype}, Ptr{realtype}, Ptr{Cint}), ida_mem, p, pbar, plist)
end

function IDASetNonlinearSolverSensSim(ida_mem, NLS::SUNNonlinearSolver)
    ccall((:IDASetNonlinearSolverSensSim, libsundials_idas), Cint, (IDAMemPtr, SUNNonlinearSolver), ida_mem, NLS)
end

function IDASetNonlinearSolverSensStg(ida_mem, NLS::SUNNonlinearSolver)
    ccall((:IDASetNonlinearSolverSensStg, libsundials_idas), Cint, (IDAMemPtr, SUNNonlinearSolver), ida_mem, NLS)
end

function IDASensToggleOff(ida_mem)
    ccall((:IDASensToggleOff, libsundials_idas), Cint, (IDAMemPtr,), ida_mem)
end

function IDAGetSens(ida_mem, tret, yySout)
    ccall((:IDAGetSens, libsundials_idas), Cint, (IDAMemPtr, Ptr{realtype}, Ptr{N_Vector}), ida_mem, tret, yySout)
end

function IDAGetSens1(ida_mem, tret, is::Cint, yySret::N_Vector)
    ccall((:IDAGetSens1, libsundials_idas), Cint, (IDAMemPtr, Ptr{realtype}, Cint, N_Vector), ida_mem, tret, is, yySret)
end

function IDAGetSens1(ida_mem, tret, is, yySret)
    __yySret = convert(NVector, yySret)
    IDAGetSens1(ida_mem, tret, convert(Cint, is), convert(N_Vector, __yySret))
end

function IDAGetSensDky(ida_mem, t::realtype, k::Cint, dkyS)
    ccall((:IDAGetSensDky, libsundials_idas), Cint, (IDAMemPtr, realtype, Cint, Ptr{N_Vector}), ida_mem, t, k, dkyS)
end

function IDAGetSensDky(ida_mem, t, k, dkyS)
    IDAGetSensDky(ida_mem, t, convert(Cint, k), dkyS)
end

function IDAGetSensDky1(ida_mem, t::realtype, k::Cint, is::Cint, dkyS::N_Vector)
    ccall((:IDAGetSensDky1, libsundials_idas), Cint, (IDAMemPtr, realtype, Cint, Cint, N_Vector), ida_mem, t, k, is, dkyS)
end

function IDAGetSensDky1(ida_mem, t, k, is, dkyS)
    __dkyS = convert(NVector, dkyS)
    IDAGetSensDky1(ida_mem, t, convert(Cint, k), convert(Cint, is), convert(N_Vector, __dkyS))
end

function IDAGetSensNumResEvals(ida_mem, nresSevals)
    ccall((:IDAGetSensNumResEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nresSevals)
end

function IDAGetNumResEvalsSens(ida_mem, nresevalsS)
    ccall((:IDAGetNumResEvalsSens, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nresevalsS)
end

function IDAGetSensNumErrTestFails(ida_mem, nSetfails)
    ccall((:IDAGetSensNumErrTestFails, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nSetfails)
end

function IDAGetSensNumLinSolvSetups(ida_mem, nlinsetupsS)
    ccall((:IDAGetSensNumLinSolvSetups, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nlinsetupsS)
end

function IDAGetSensErrWeights(ida_mem, eSweight::N_Vector_S)
    ccall((:IDAGetSensErrWeights, libsundials_idas), Cint, (IDAMemPtr, N_Vector_S), ida_mem, eSweight)
end

function IDAGetSensStats(ida_mem, nresSevals, nresevalsS, nSetfails, nlinsetupsS)
    ccall((:IDAGetSensStats, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}), ida_mem, nresSevals, nresevalsS, nSetfails, nlinsetupsS)
end

function IDAGetSensNumNonlinSolvIters(ida_mem, nSniters)
    ccall((:IDAGetSensNumNonlinSolvIters, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nSniters)
end

function IDAGetSensNumNonlinSolvConvFails(ida_mem, nSncfails)
    ccall((:IDAGetSensNumNonlinSolvConvFails, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nSncfails)
end

function IDAGetSensNonlinSolvStats(ida_mem, nSniters, nSncfails)
    ccall((:IDAGetSensNonlinSolvStats, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}, Ptr{Clong}), ida_mem, nSniters, nSncfails)
end

function IDASensFree(ida_mem)
    ccall((:IDASensFree, libsundials_idas), Cvoid, (IDAMemPtr,), ida_mem)
end

function IDAQuadSensInit(ida_mem, resQS::IDAQuadSensRhsFn, yQS0)
    ccall((:IDAQuadSensInit, libsundials_idas), Cint, (IDAMemPtr, IDAQuadSensRhsFn, Ptr{N_Vector}), ida_mem, resQS, yQS0)
end

function IDAQuadSensReInit(ida_mem, yQS0)
    ccall((:IDAQuadSensReInit, libsundials_idas), Cint, (IDAMemPtr, Ptr{N_Vector}), ida_mem, yQS0)
end

function IDAQuadSensSStolerances(ida_mem, reltolQS::realtype, abstolQS)
    ccall((:IDAQuadSensSStolerances, libsundials_idas), Cint, (IDAMemPtr, realtype, Ptr{realtype}), ida_mem, reltolQS, abstolQS)
end

function IDAQuadSensSVtolerances(ida_mem, reltolQS::realtype, abstolQS)
    ccall((:IDAQuadSensSVtolerances, libsundials_idas), Cint, (IDAMemPtr, realtype, Ptr{N_Vector}), ida_mem, reltolQS, abstolQS)
end

function IDAQuadSensEEtolerances(ida_mem)
    ccall((:IDAQuadSensEEtolerances, libsundials_idas), Cint, (IDAMemPtr,), ida_mem)
end

function IDASetQuadSensErrCon(ida_mem, errconQS::Cint)
    ccall((:IDASetQuadSensErrCon, libsundials_idas), Cint, (IDAMemPtr, Cint), ida_mem, errconQS)
end

function IDASetQuadSensErrCon(ida_mem, errconQS)
    IDASetQuadSensErrCon(ida_mem, convert(Cint, errconQS))
end

function IDAGetQuadSens(ida_mem, tret, yyQSout)
    ccall((:IDAGetQuadSens, libsundials_idas), Cint, (IDAMemPtr, Ptr{realtype}, Ptr{N_Vector}), ida_mem, tret, yyQSout)
end

function IDAGetQuadSens1(ida_mem, tret, is::Cint, yyQSret::N_Vector)
    ccall((:IDAGetQuadSens1, libsundials_idas), Cint, (IDAMemPtr, Ptr{realtype}, Cint, N_Vector), ida_mem, tret, is, yyQSret)
end

function IDAGetQuadSens1(ida_mem, tret, is, yyQSret)
    __yyQSret = convert(NVector, yyQSret)
    IDAGetQuadSens1(ida_mem, tret, convert(Cint, is), convert(N_Vector, __yyQSret))
end

function IDAGetQuadSensDky(ida_mem, t::realtype, k::Cint, dkyQS)
    ccall((:IDAGetQuadSensDky, libsundials_idas), Cint, (IDAMemPtr, realtype, Cint, Ptr{N_Vector}), ida_mem, t, k, dkyQS)
end

function IDAGetQuadSensDky(ida_mem, t, k, dkyQS)
    IDAGetQuadSensDky(ida_mem, t, convert(Cint, k), dkyQS)
end

function IDAGetQuadSensDky1(ida_mem, t::realtype, k::Cint, is::Cint, dkyQS::N_Vector)
    ccall((:IDAGetQuadSensDky1, libsundials_idas), Cint, (IDAMemPtr, realtype, Cint, Cint, N_Vector), ida_mem, t, k, is, dkyQS)
end

function IDAGetQuadSensDky1(ida_mem, t, k, is, dkyQS)
    __dkyQS = convert(NVector, dkyQS)
    IDAGetQuadSensDky1(ida_mem, t, convert(Cint, k), convert(Cint, is), convert(N_Vector, __dkyQS))
end

function IDAGetQuadSensNumRhsEvals(ida_mem, nrhsQSevals)
    ccall((:IDAGetQuadSensNumRhsEvals, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nrhsQSevals)
end

function IDAGetQuadSensNumErrTestFails(ida_mem, nQSetfails)
    ccall((:IDAGetQuadSensNumErrTestFails, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}), ida_mem, nQSetfails)
end

function IDAGetQuadSensErrWeights(ida_mem, eQSweight)
    ccall((:IDAGetQuadSensErrWeights, libsundials_idas), Cint, (IDAMemPtr, Ptr{N_Vector}), ida_mem, eQSweight)
end

function IDAGetQuadSensStats(ida_mem, nrhsQSevals, nQSetfails)
    ccall((:IDAGetQuadSensStats, libsundials_idas), Cint, (IDAMemPtr, Ptr{Clong}, Ptr{Clong}), ida_mem, nrhsQSevals, nQSetfails)
end

function IDAQuadSensFree(ida_mem)
    ccall((:IDAQuadSensFree, libsundials_idas), Cvoid, (IDAMemPtr,), ida_mem)
end

function IDAAdjInit(ida_mem, steps::Clong, interp::Cint)
    ccall((:IDAAdjInit, libsundials_idas), Cint, (IDAMemPtr, Clong, Cint), ida_mem, steps, interp)
end

function IDAAdjInit(ida_mem, steps, interp)
    IDAAdjInit(ida_mem, convert(Clong, steps), convert(Cint, interp))
end

function IDAAdjReInit(ida_mem)
    ccall((:IDAAdjReInit, libsundials_idas), Cint, (IDAMemPtr,), ida_mem)
end

function IDAAdjFree(ida_mem)
    ccall((:IDAAdjFree, libsundials_idas), Cvoid, (IDAMemPtr,), ida_mem)
end

function IDACreateB(ida_mem, which)
    ccall((:IDACreateB, libsundials_idas), Cint, (IDAMemPtr, Ptr{Cint}), ida_mem, which)
end

function IDAInitB(ida_mem, which::Cint, resB::IDAResFnB, tB0::realtype, yyB0::N_Vector, ypB0::N_Vector)
    ccall((:IDAInitB, libsundials_idas), Cint, (IDAMemPtr, Cint, IDAResFnB, realtype, N_Vector, N_Vector), ida_mem, which, resB, tB0, yyB0, ypB0)
end

function IDAInitB(ida_mem, which, resB, tB0, yyB0, ypB0)
    __yyB0 = convert(NVector, yyB0)
    __ypB0 = convert(NVector, ypB0)
    IDAInitB(ida_mem, convert(Cint, which), resB, tB0, convert(N_Vector, __yyB0), convert(N_Vector, __ypB0))
end

function IDAInitBS(ida_mem, which::Cint, resS::IDAResFnBS, tB0::realtype, yyB0::N_Vector, ypB0::N_Vector)
    ccall((:IDAInitBS, libsundials_idas), Cint, (IDAMemPtr, Cint, IDAResFnBS, realtype, N_Vector, N_Vector), ida_mem, which, resS, tB0, yyB0, ypB0)
end

function IDAInitBS(ida_mem, which, resS, tB0, yyB0, ypB0)
    __yyB0 = convert(NVector, yyB0)
    __ypB0 = convert(NVector, ypB0)
    IDAInitBS(ida_mem, convert(Cint, which), resS, tB0, convert(N_Vector, __yyB0), convert(N_Vector, __ypB0))
end

function IDAReInitB(ida_mem, which::Cint, tB0::realtype, yyB0::N_Vector, ypB0::N_Vector)
    ccall((:IDAReInitB, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype, N_Vector, N_Vector), ida_mem, which, tB0, yyB0, ypB0)
end

function IDAReInitB(ida_mem, which, tB0, yyB0, ypB0)
    __yyB0 = convert(NVector, yyB0)
    __ypB0 = convert(NVector, ypB0)
    IDAReInitB(ida_mem, convert(Cint, which), tB0, convert(N_Vector, __yyB0), convert(N_Vector, __ypB0))
end

function IDASStolerancesB(ida_mem, which::Cint, relTolB::realtype, absTolB::realtype)
    ccall((:IDASStolerancesB, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype, realtype), ida_mem, which, relTolB, absTolB)
end

function IDASStolerancesB(ida_mem, which, relTolB, absTolB)
    IDASStolerancesB(ida_mem, convert(Cint, which), relTolB, absTolB)
end

function IDASVtolerancesB(ida_mem, which::Cint, relTolB::realtype, absTolB::N_Vector)
    ccall((:IDASVtolerancesB, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype, N_Vector), ida_mem, which, relTolB, absTolB)
end

function IDASVtolerancesB(ida_mem, which, relTolB, absTolB)
    __absTolB = convert(NVector, absTolB)
    IDASVtolerancesB(ida_mem, convert(Cint, which), relTolB, convert(N_Vector, __absTolB))
end

function IDAQuadInitB(ida_mem, which::Cint, rhsQB::IDAQuadRhsFnB, yQB0::N_Vector)
    ccall((:IDAQuadInitB, libsundials_idas), Cint, (IDAMemPtr, Cint, IDAQuadRhsFnB, N_Vector), ida_mem, which, rhsQB, yQB0)
end

function IDAQuadInitB(ida_mem, which, rhsQB, yQB0)
    __yQB0 = convert(NVector, yQB0)
    IDAQuadInitB(ida_mem, convert(Cint, which), rhsQB, convert(N_Vector, __yQB0))
end

function IDAQuadInitBS(ida_mem, which::Cint, rhsQS::IDAQuadRhsFnBS, yQB0::N_Vector)
    ccall((:IDAQuadInitBS, libsundials_idas), Cint, (IDAMemPtr, Cint, IDAQuadRhsFnBS, N_Vector), ida_mem, which, rhsQS, yQB0)
end

function IDAQuadInitBS(ida_mem, which, rhsQS, yQB0)
    __yQB0 = convert(NVector, yQB0)
    IDAQuadInitBS(ida_mem, convert(Cint, which), rhsQS, convert(N_Vector, __yQB0))
end

function IDAQuadReInitB(ida_mem, which::Cint, yQB0::N_Vector)
    ccall((:IDAQuadReInitB, libsundials_idas), Cint, (IDAMemPtr, Cint, N_Vector), ida_mem, which, yQB0)
end

function IDAQuadReInitB(ida_mem, which, yQB0)
    __yQB0 = convert(NVector, yQB0)
    IDAQuadReInitB(ida_mem, convert(Cint, which), convert(N_Vector, __yQB0))
end

function IDAQuadSStolerancesB(ida_mem, which::Cint, reltolQB::realtype, abstolQB::realtype)
    ccall((:IDAQuadSStolerancesB, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype, realtype), ida_mem, which, reltolQB, abstolQB)
end

function IDAQuadSStolerancesB(ida_mem, which, reltolQB, abstolQB)
    IDAQuadSStolerancesB(ida_mem, convert(Cint, which), reltolQB, abstolQB)
end

function IDAQuadSVtolerancesB(ida_mem, which::Cint, reltolQB::realtype, abstolQB::N_Vector)
    ccall((:IDAQuadSVtolerancesB, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype, N_Vector), ida_mem, which, reltolQB, abstolQB)
end

function IDAQuadSVtolerancesB(ida_mem, which, reltolQB, abstolQB)
    __abstolQB = convert(NVector, abstolQB)
    IDAQuadSVtolerancesB(ida_mem, convert(Cint, which), reltolQB, convert(N_Vector, __abstolQB))
end

function IDACalcICB(ida_mem, which::Cint, tout1::realtype, yy0::N_Vector, yp0::N_Vector)
    ccall((:IDACalcICB, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype, N_Vector, N_Vector), ida_mem, which, tout1, yy0, yp0)
end

function IDACalcICB(ida_mem, which, tout1, yy0, yp0)
    __yy0 = convert(NVector, yy0)
    __yp0 = convert(NVector, yp0)
    IDACalcICB(ida_mem, convert(Cint, which), tout1, convert(N_Vector, __yy0), convert(N_Vector, __yp0))
end

function IDACalcICBS(ida_mem, which::Cint, tout1::realtype, yy0::N_Vector, yp0::N_Vector, yyS0, ypS0)
    ccall((:IDACalcICBS, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype, N_Vector, N_Vector, Ptr{N_Vector}, Ptr{N_Vector}), ida_mem, which, tout1, yy0, yp0, yyS0, ypS0)
end

function IDACalcICBS(ida_mem, which, tout1, yy0, yp0, yyS0, ypS0)
    __yy0 = convert(NVector, yy0)
    __yp0 = convert(NVector, yp0)
    IDACalcICBS(ida_mem, convert(Cint, which), tout1, convert(N_Vector, __yy0), convert(N_Vector, __yp0), yyS0, ypS0)
end

function IDASolveF(ida_mem, tout::realtype, tret, yret::N_Vector, ypret::N_Vector, itask::Cint, ncheckPtr)
    ccall((:IDASolveF, libsundials_idas), Cint, (IDAMemPtr, realtype, Ptr{realtype}, N_Vector, N_Vector, Cint, Ptr{Cint}), ida_mem, tout, tret, yret, ypret, itask, ncheckPtr)
end

function IDASolveF(ida_mem, tout, tret, yret, ypret, itask, ncheckPtr)
    __yret = convert(NVector, yret)
    __ypret = convert(NVector, ypret)
    IDASolveF(ida_mem, tout, tret, convert(N_Vector, __yret), convert(N_Vector, __ypret), convert(Cint, itask), ncheckPtr)
end

function IDASolveB(ida_mem, tBout::realtype, itaskB::Cint)
    ccall((:IDASolveB, libsundials_idas), Cint, (IDAMemPtr, realtype, Cint), ida_mem, tBout, itaskB)
end

function IDASolveB(ida_mem, tBout, itaskB)
    IDASolveB(ida_mem, tBout, convert(Cint, itaskB))
end

function IDAAdjSetNoSensi(ida_mem)
    ccall((:IDAAdjSetNoSensi, libsundials_idas), Cint, (IDAMemPtr,), ida_mem)
end

function IDASetUserDataB(ida_mem, which::Cint, user_dataB)
    ccall((:IDASetUserDataB, libsundials_idas), Cint, (IDAMemPtr, Cint, Any), ida_mem, which, user_dataB)
end

function IDASetUserDataB(ida_mem, which, user_dataB)
    IDASetUserDataB(ida_mem, convert(Cint, which), user_dataB)
end

function IDASetMaxOrdB(ida_mem, which::Cint, maxordB::Cint)
    ccall((:IDASetMaxOrdB, libsundials_idas), Cint, (IDAMemPtr, Cint, Cint), ida_mem, which, maxordB)
end

function IDASetMaxOrdB(ida_mem, which, maxordB)
    IDASetMaxOrdB(ida_mem, convert(Cint, which), convert(Cint, maxordB))
end

function IDASetMaxNumStepsB(ida_mem, which::Cint, mxstepsB::Clong)
    ccall((:IDASetMaxNumStepsB, libsundials_idas), Cint, (IDAMemPtr, Cint, Clong), ida_mem, which, mxstepsB)
end

function IDASetMaxNumStepsB(ida_mem, which, mxstepsB)
    IDASetMaxNumStepsB(ida_mem, convert(Cint, which), convert(Clong, mxstepsB))
end

function IDASetInitStepB(ida_mem, which::Cint, hinB::realtype)
    ccall((:IDASetInitStepB, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype), ida_mem, which, hinB)
end

function IDASetInitStepB(ida_mem, which, hinB)
    IDASetInitStepB(ida_mem, convert(Cint, which), hinB)
end

function IDASetMaxStepB(ida_mem, which::Cint, hmaxB::realtype)
    ccall((:IDASetMaxStepB, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype), ida_mem, which, hmaxB)
end

function IDASetMaxStepB(ida_mem, which, hmaxB)
    IDASetMaxStepB(ida_mem, convert(Cint, which), hmaxB)
end

function IDASetSuppressAlgB(ida_mem, which::Cint, suppressalgB::Cint)
    ccall((:IDASetSuppressAlgB, libsundials_idas), Cint, (IDAMemPtr, Cint, Cint), ida_mem, which, suppressalgB)
end

function IDASetSuppressAlgB(ida_mem, which, suppressalgB)
    IDASetSuppressAlgB(ida_mem, convert(Cint, which), convert(Cint, suppressalgB))
end

function IDASetIdB(ida_mem, which::Cint, idB::N_Vector)
    ccall((:IDASetIdB, libsundials_idas), Cint, (IDAMemPtr, Cint, N_Vector), ida_mem, which, idB)
end

function IDASetIdB(ida_mem, which, idB)
    __idB = convert(NVector, idB)
    IDASetIdB(ida_mem, convert(Cint, which), convert(N_Vector, __idB))
end

function IDASetConstraintsB(ida_mem, which::Cint, constraintsB::N_Vector)
    ccall((:IDASetConstraintsB, libsundials_idas), Cint, (IDAMemPtr, Cint, N_Vector), ida_mem, which, constraintsB)
end

function IDASetConstraintsB(ida_mem, which, constraintsB)
    __constraintsB = convert(NVector, constraintsB)
    IDASetConstraintsB(ida_mem, convert(Cint, which), convert(N_Vector, __constraintsB))
end

function IDASetQuadErrConB(ida_mem, which::Cint, errconQB::Cint)
    ccall((:IDASetQuadErrConB, libsundials_idas), Cint, (IDAMemPtr, Cint, Cint), ida_mem, which, errconQB)
end

function IDASetQuadErrConB(ida_mem, which, errconQB)
    IDASetQuadErrConB(ida_mem, convert(Cint, which), convert(Cint, errconQB))
end

function IDASetNonlinearSolverB(ida_mem, which::Cint, NLS::SUNNonlinearSolver)
    ccall((:IDASetNonlinearSolverB, libsundials_idas), Cint, (IDAMemPtr, Cint, SUNNonlinearSolver), ida_mem, which, NLS)
end

function IDASetNonlinearSolverB(ida_mem, which, NLS)
    IDASetNonlinearSolverB(ida_mem, convert(Cint, which), NLS)
end

function IDAGetB(ida_mem, which::Cint, tret, yy::N_Vector, yp::N_Vector)
    ccall((:IDAGetB, libsundials_idas), Cint, (IDAMemPtr, Cint, Ptr{realtype}, N_Vector, N_Vector), ida_mem, which, tret, yy, yp)
end

function IDAGetB(ida_mem, which, tret, yy, yp)
    __yy = convert(NVector, yy)
    __yp = convert(NVector, yp)
    IDAGetB(ida_mem, convert(Cint, which), tret, convert(N_Vector, __yy), convert(N_Vector, __yp))
end

function IDAGetQuadB(ida_mem, which::Cint, tret, qB::N_Vector)
    ccall((:IDAGetQuadB, libsundials_idas), Cint, (IDAMemPtr, Cint, Ptr{realtype}, N_Vector), ida_mem, which, tret, qB)
end

function IDAGetQuadB(ida_mem, which, tret, qB)
    __qB = convert(NVector, qB)
    IDAGetQuadB(ida_mem, convert(Cint, which), tret, convert(N_Vector, __qB))
end

function IDAGetAdjIDABmem(ida_mem, which::Cint)
    ccall((:IDAGetAdjIDABmem, libsundials_idas), Ptr{Cvoid}, (IDAMemPtr, Cint), ida_mem, which)
end

function IDAGetAdjIDABmem(ida_mem, which)
    IDAGetAdjIDABmem(ida_mem, convert(Cint, which))
end

function IDAGetConsistentICB(ida_mem, which::Cint, yyB0::N_Vector, ypB0::N_Vector)
    ccall((:IDAGetConsistentICB, libsundials_idas), Cint, (IDAMemPtr, Cint, N_Vector, N_Vector), ida_mem, which, yyB0, ypB0)
end

function IDAGetConsistentICB(ida_mem, which, yyB0, ypB0)
    __yyB0 = convert(NVector, yyB0)
    __ypB0 = convert(NVector, ypB0)
    IDAGetConsistentICB(ida_mem, convert(Cint, which), convert(N_Vector, __yyB0), convert(N_Vector, __ypB0))
end

function IDAGetAdjY(ida_mem, t::realtype, yy::N_Vector, yp::N_Vector)
    ccall((:IDAGetAdjY, libsundials_idas), Cint, (IDAMemPtr, realtype, N_Vector, N_Vector), ida_mem, t, yy, yp)
end

function IDAGetAdjY(ida_mem, t, yy, yp)
    __yy = convert(NVector, yy)
    __yp = convert(NVector, yp)
    IDAGetAdjY(ida_mem, t, convert(N_Vector, __yy), convert(N_Vector, __yp))
end

function IDAGetAdjCheckPointsInfo(ida_mem, ckpnt)
    ccall((:IDAGetAdjCheckPointsInfo, libsundials_idas), Cint, (IDAMemPtr, Ptr{IDAadjCheckPointRec}), ida_mem, ckpnt)
end

function IDAGetAdjDataPointHermite(ida_mem, which::Cint, t, yy::N_Vector, yd::N_Vector)
    ccall((:IDAGetAdjDataPointHermite, libsundials_idas), Cint, (IDAMemPtr, Cint, Ptr{realtype}, N_Vector, N_Vector), ida_mem, which, t, yy, yd)
end

function IDAGetAdjDataPointHermite(ida_mem, which, t, yy, yd)
    __yy = convert(NVector, yy)
    __yd = convert(NVector, yd)
    IDAGetAdjDataPointHermite(ida_mem, convert(Cint, which), t, convert(N_Vector, __yy), convert(N_Vector, __yd))
end

function IDAGetAdjDataPointPolynomial(ida_mem, which::Cint, t, order, y::N_Vector)
    ccall((:IDAGetAdjDataPointPolynomial, libsundials_idas), Cint, (IDAMemPtr, Cint, Ptr{realtype}, Ptr{Cint}, N_Vector), ida_mem, which, t, order, y)
end

function IDAGetAdjDataPointPolynomial(ida_mem, which, t, order, y)
    __y = convert(NVector, y)
    IDAGetAdjDataPointPolynomial(ida_mem, convert(Cint, which), t, order, convert(N_Vector, __y))
end

function IDAGetAdjCurrentCheckPoint(ida_mem, addr)
    ccall((:IDAGetAdjCurrentCheckPoint, libsundials_idas), Cint, (IDAMemPtr, Ptr{Ptr{Cvoid}}), ida_mem, addr)
end

function IDABBDPrecInitB(ida_mem, which::Cint, NlocalB::sunindextype, mudqB::sunindextype, mldqB::sunindextype, mukeepB::sunindextype, mlkeepB::sunindextype, dq_rel_yyB::realtype, GresB::IDABBDLocalFnB, GcommB::IDABBDCommFnB)
    ccall((:IDABBDPrecInitB, libsundials_idas), Cint, (IDAMemPtr, Cint, sunindextype, sunindextype, sunindextype, sunindextype, sunindextype, realtype, IDABBDLocalFnB, IDABBDCommFnB), ida_mem, which, NlocalB, mudqB, mldqB, mukeepB, mlkeepB, dq_rel_yyB, GresB, GcommB)
end

function IDABBDPrecInitB(ida_mem, which, NlocalB, mudqB, mldqB, mukeepB, mlkeepB, dq_rel_yyB, GresB, GcommB)
    IDABBDPrecInitB(ida_mem, convert(Cint, which), NlocalB, mudqB, mldqB, mukeepB, mlkeepB, dq_rel_yyB, GresB, GcommB)
end

function IDABBDPrecReInitB(ida_mem, which::Cint, mudqB::sunindextype, mldqB::sunindextype, dq_rel_yyB::realtype)
    ccall((:IDABBDPrecReInitB, libsundials_idas), Cint, (IDAMemPtr, Cint, sunindextype, sunindextype, realtype), ida_mem, which, mudqB, mldqB, dq_rel_yyB)
end

function IDABBDPrecReInitB(ida_mem, which, mudqB, mldqB, dq_rel_yyB)
    IDABBDPrecReInitB(ida_mem, convert(Cint, which), mudqB, mldqB, dq_rel_yyB)
end

function IDADlsSetLinearSolverB(ida_mem, which::Cint, LS::SUNLinearSolver, A::SUNMatrix)
    ccall((:IDADlsSetLinearSolverB, libsundials_idas), Cint, (IDAMemPtr, Cint, SUNLinearSolver, SUNMatrix), ida_mem, which, LS, A)
end

function IDADlsSetLinearSolverB(ida_mem, which, LS, A)
    IDADlsSetLinearSolverB(ida_mem, convert(Cint, which), LS, A)
end

function IDADlsSetJacFnB(ida_mem, which::Cint, jacB::IDADlsJacFnB)
    ccall((:IDADlsSetJacFnB, libsundials_idas), Cint, (IDAMemPtr, Cint, IDADlsJacFnB), ida_mem, which, jacB)
end

function IDADlsSetJacFnB(ida_mem, which, jacB)
    IDADlsSetJacFnB(ida_mem, convert(Cint, which), jacB)
end

function IDADlsSetJacFnBS(ida_mem, which::Cint, jacBS::IDADlsJacFnBS)
    ccall((:IDADlsSetJacFnBS, libsundials_idas), Cint, (IDAMemPtr, Cint, IDADlsJacFnBS), ida_mem, which, jacBS)
end

function IDADlsSetJacFnBS(ida_mem, which, jacBS)
    IDADlsSetJacFnBS(ida_mem, convert(Cint, which), jacBS)
end

function IDASetLinearSolverB(ida_mem, which::Cint, LS::SUNLinearSolver, A::SUNMatrix)
    ccall((:IDASetLinearSolverB, libsundials_idas), Cint, (IDAMemPtr, Cint, SUNLinearSolver, SUNMatrix), ida_mem, which, LS, A)
end

function IDASetLinearSolverB(ida_mem, which, LS, A)
    IDASetLinearSolverB(ida_mem, convert(Cint, which), LS, A)
end

function IDASetJacFnB(ida_mem, which::Cint, jacB::IDALsJacFnB)
    ccall((:IDASetJacFnB, libsundials_idas), Cint, (IDAMemPtr, Cint, IDALsJacFnB), ida_mem, which, jacB)
end

function IDASetJacFnB(ida_mem, which, jacB)
    IDASetJacFnB(ida_mem, convert(Cint, which), jacB)
end

function IDASetJacFnBS(ida_mem, which::Cint, jacBS::IDALsJacFnBS)
    ccall((:IDASetJacFnBS, libsundials_idas), Cint, (IDAMemPtr, Cint, IDALsJacFnBS), ida_mem, which, jacBS)
end

function IDASetJacFnBS(ida_mem, which, jacBS)
    IDASetJacFnBS(ida_mem, convert(Cint, which), jacBS)
end

function IDASetEpsLinB(ida_mem, which::Cint, eplifacB::realtype)
    ccall((:IDASetEpsLinB, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype), ida_mem, which, eplifacB)
end

function IDASetEpsLinB(ida_mem, which, eplifacB)
    IDASetEpsLinB(ida_mem, convert(Cint, which), eplifacB)
end

function IDASetLinearSolutionScalingB(ida_mem, which::Cint, onoffB::Cint)
    ccall((:IDASetLinearSolutionScalingB, libsundials_idas), Cint, (IDAMemPtr, Cint, Cint), ida_mem, which, onoffB)
end

function IDASetLinearSolutionScalingB(ida_mem, which, onoffB)
    IDASetLinearSolutionScalingB(ida_mem, convert(Cint, which), convert(Cint, onoffB))
end

function IDASetIncrementFactorB(ida_mem, which::Cint, dqincfacB::realtype)
    ccall((:IDASetIncrementFactorB, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype), ida_mem, which, dqincfacB)
end

function IDASetIncrementFactorB(ida_mem, which, dqincfacB)
    IDASetIncrementFactorB(ida_mem, convert(Cint, which), dqincfacB)
end

function IDASetPreconditionerB(ida_mem, which::Cint, psetB::IDALsPrecSetupFnB, psolveB::IDALsPrecSolveFnB)
    ccall((:IDASetPreconditionerB, libsundials_idas), Cint, (IDAMemPtr, Cint, IDALsPrecSetupFnB, IDALsPrecSolveFnB), ida_mem, which, psetB, psolveB)
end

function IDASetPreconditionerB(ida_mem, which, psetB, psolveB)
    IDASetPreconditionerB(ida_mem, convert(Cint, which), psetB, psolveB)
end

function IDASetPreconditionerBS(ida_mem, which::Cint, psetBS::IDALsPrecSetupFnBS, psolveBS::IDALsPrecSolveFnBS)
    ccall((:IDASetPreconditionerBS, libsundials_idas), Cint, (IDAMemPtr, Cint, IDALsPrecSetupFnBS, IDALsPrecSolveFnBS), ida_mem, which, psetBS, psolveBS)
end

function IDASetPreconditionerBS(ida_mem, which, psetBS, psolveBS)
    IDASetPreconditionerBS(ida_mem, convert(Cint, which), psetBS, psolveBS)
end

function IDASetJacTimesB(ida_mem, which::Cint, jtsetupB::IDALsJacTimesSetupFnB, jtimesB::IDALsJacTimesVecFnB)
    ccall((:IDASetJacTimesB, libsundials_idas), Cint, (IDAMemPtr, Cint, IDALsJacTimesSetupFnB, IDALsJacTimesVecFnB), ida_mem, which, jtsetupB, jtimesB)
end

function IDASetJacTimesB(ida_mem, which, jtsetupB, jtimesB)
    IDASetJacTimesB(ida_mem, convert(Cint, which), jtsetupB, jtimesB)
end

function IDASetJacTimesBS(ida_mem, which::Cint, jtsetupBS::IDALsJacTimesSetupFnBS, jtimesBS::IDALsJacTimesVecFnBS)
    ccall((:IDASetJacTimesBS, libsundials_idas), Cint, (IDAMemPtr, Cint, IDALsJacTimesSetupFnBS, IDALsJacTimesVecFnBS), ida_mem, which, jtsetupBS, jtimesBS)
end

function IDASetJacTimesBS(ida_mem, which, jtsetupBS, jtimesBS)
    IDASetJacTimesBS(ida_mem, convert(Cint, which), jtsetupBS, jtimesBS)
end

function IDASpilsSetLinearSolverB(ida_mem, which::Cint, LS::SUNLinearSolver)
    ccall((:IDASpilsSetLinearSolverB, libsundials_idas), Cint, (IDAMemPtr, Cint, SUNLinearSolver), ida_mem, which, LS)
end

function IDASpilsSetLinearSolverB(ida_mem, which, LS)
    IDASpilsSetLinearSolverB(ida_mem, convert(Cint, which), LS)
end

function IDASpilsSetEpsLinB(ida_mem, which::Cint, eplifacB::realtype)
    ccall((:IDASpilsSetEpsLinB, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype), ida_mem, which, eplifacB)
end

function IDASpilsSetEpsLinB(ida_mem, which, eplifacB)
    IDASpilsSetEpsLinB(ida_mem, convert(Cint, which), eplifacB)
end

function IDASpilsSetIncrementFactorB(ida_mem, which::Cint, dqincfacB::realtype)
    ccall((:IDASpilsSetIncrementFactorB, libsundials_idas), Cint, (IDAMemPtr, Cint, realtype), ida_mem, which, dqincfacB)
end

function IDASpilsSetIncrementFactorB(ida_mem, which, dqincfacB)
    IDASpilsSetIncrementFactorB(ida_mem, convert(Cint, which), dqincfacB)
end

function IDASpilsSetPreconditionerB(ida_mem, which::Cint, psetB::IDASpilsPrecSetupFnB, psolveB::IDASpilsPrecSolveFnB)
    ccall((:IDASpilsSetPreconditionerB, libsundials_idas), Cint, (IDAMemPtr, Cint, IDASpilsPrecSetupFnB, IDASpilsPrecSolveFnB), ida_mem, which, psetB, psolveB)
end

function IDASpilsSetPreconditionerB(ida_mem, which, psetB, psolveB)
    IDASpilsSetPreconditionerB(ida_mem, convert(Cint, which), psetB, psolveB)
end

function IDASpilsSetPreconditionerBS(ida_mem, which::Cint, psetBS::IDASpilsPrecSetupFnBS, psolveBS::IDASpilsPrecSolveFnBS)
    ccall((:IDASpilsSetPreconditionerBS, libsundials_idas), Cint, (IDAMemPtr, Cint, IDASpilsPrecSetupFnBS, IDASpilsPrecSolveFnBS), ida_mem, which, psetBS, psolveBS)
end

function IDASpilsSetPreconditionerBS(ida_mem, which, psetBS, psolveBS)
    IDASpilsSetPreconditionerBS(ida_mem, convert(Cint, which), psetBS, psolveBS)
end

function IDASpilsSetJacTimesB(ida_mem, which::Cint, jtsetupB::IDASpilsJacTimesSetupFnB, jtimesB::IDASpilsJacTimesVecFnB)
    ccall((:IDASpilsSetJacTimesB, libsundials_idas), Cint, (IDAMemPtr, Cint, IDASpilsJacTimesSetupFnB, IDASpilsJacTimesVecFnB), ida_mem, which, jtsetupB, jtimesB)
end

function IDASpilsSetJacTimesB(ida_mem, which, jtsetupB, jtimesB)
    IDASpilsSetJacTimesB(ida_mem, convert(Cint, which), jtsetupB, jtimesB)
end

function IDASpilsSetJacTimesBS(ida_mem, which::Cint, jtsetupBS::IDASpilsJacTimesSetupFnBS, jtimesBS::IDASpilsJacTimesVecFnBS)
    ccall((:IDASpilsSetJacTimesBS, libsundials_idas), Cint, (IDAMemPtr, Cint, IDASpilsJacTimesSetupFnBS, IDASpilsJacTimesVecFnBS), ida_mem, which, jtsetupBS, jtimesBS)
end

function IDASpilsSetJacTimesBS(ida_mem, which, jtsetupBS, jtimesBS)
    IDASpilsSetJacTimesBS(ida_mem, convert(Cint, which), jtsetupBS, jtimesBS)
end

function KINCreate()
    ccall((:KINCreate, libsundials_kinsol), KINMemPtr, ())
end

function KINInit(kinmem, func::KINSysFn, tmpl::N_Vector)
    ccall((:KINInit, libsundials_kinsol), Cint, (KINMemPtr, KINSysFn, N_Vector), kinmem, func, tmpl)
end

function KINInit(kinmem, func, tmpl)
    __tmpl = convert(NVector, tmpl)
    KINInit(kinmem, KINSysFn_wrapper(func), convert(N_Vector, __tmpl))
end

function KINSol(kinmem, uu::N_Vector, strategy::Cint, u_scale::N_Vector, f_scale::N_Vector)
    ccall((:KINSol, libsundials_kinsol), Cint, (KINMemPtr, N_Vector, Cint, N_Vector, N_Vector), kinmem, uu, strategy, u_scale, f_scale)
end

function KINSol(kinmem, uu, strategy, u_scale, f_scale)
    __uu = convert(NVector, uu)
    __u_scale = convert(NVector, u_scale)
    __f_scale = convert(NVector, f_scale)
    KINSol(kinmem, convert(N_Vector, __uu), convert(Cint, strategy), convert(N_Vector, __u_scale), convert(N_Vector, __f_scale))
end

function KINSetErrHandlerFn(kinmem, ehfun::KINErrHandlerFn, eh_data)
    ccall((:KINSetErrHandlerFn, libsundials_kinsol), Cint, (KINMemPtr, KINErrHandlerFn, Ptr{Cvoid}), kinmem, ehfun, eh_data)
end

function KINSetErrFile(kinmem, errfp)
    ccall((:KINSetErrFile, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Libc.FILE}), kinmem, errfp)
end

function KINSetInfoHandlerFn(kinmem, ihfun::KINInfoHandlerFn, ih_data)
    ccall((:KINSetInfoHandlerFn, libsundials_kinsol), Cint, (KINMemPtr, KINInfoHandlerFn, Ptr{Cvoid}), kinmem, ihfun, ih_data)
end

function KINSetInfoFile(kinmem, infofp)
    ccall((:KINSetInfoFile, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Libc.FILE}), kinmem, infofp)
end

function KINSetUserData(kinmem, user_data)
    ccall((:KINSetUserData, libsundials_kinsol), Cint, (KINMemPtr, Any), kinmem, user_data)
end

function KINSetPrintLevel(kinmemm, printfl::Cint)
    ccall((:KINSetPrintLevel, libsundials_kinsol), Cint, (KINMemPtr, Cint), kinmemm, printfl)
end

function KINSetPrintLevel(kinmemm, printfl)
    KINSetPrintLevel(kinmemm, convert(Cint, printfl))
end

function KINSetMAA(kinmem, maa::Clong)
    ccall((:KINSetMAA, libsundials_kinsol), Cint, (KINMemPtr, Clong), kinmem, maa)
end

function KINSetMAA(kinmem, maa)
    KINSetMAA(kinmem, convert(Clong, maa))
end

function KINSetDampingAA(kinmem, beta::realtype)
    ccall((:KINSetDampingAA, libsundials_kinsol), Cint, (KINMemPtr, realtype), kinmem, beta)
end

function KINSetNumMaxIters(kinmem, mxiter::Clong)
    ccall((:KINSetNumMaxIters, libsundials_kinsol), Cint, (KINMemPtr, Clong), kinmem, mxiter)
end

function KINSetNumMaxIters(kinmem, mxiter)
    KINSetNumMaxIters(kinmem, convert(Clong, mxiter))
end

function KINSetNoInitSetup(kinmem, noInitSetup::Cint)
    ccall((:KINSetNoInitSetup, libsundials_kinsol), Cint, (KINMemPtr, Cint), kinmem, noInitSetup)
end

function KINSetNoInitSetup(kinmem, noInitSetup)
    KINSetNoInitSetup(kinmem, convert(Cint, noInitSetup))
end

function KINSetNoResMon(kinmem, noNNIResMon::Cint)
    ccall((:KINSetNoResMon, libsundials_kinsol), Cint, (KINMemPtr, Cint), kinmem, noNNIResMon)
end

function KINSetNoResMon(kinmem, noNNIResMon)
    KINSetNoResMon(kinmem, convert(Cint, noNNIResMon))
end

function KINSetMaxSetupCalls(kinmem, msbset::Clong)
    ccall((:KINSetMaxSetupCalls, libsundials_kinsol), Cint, (KINMemPtr, Clong), kinmem, msbset)
end

function KINSetMaxSetupCalls(kinmem, msbset)
    KINSetMaxSetupCalls(kinmem, convert(Clong, msbset))
end

function KINSetMaxSubSetupCalls(kinmem, msbsetsub::Clong)
    ccall((:KINSetMaxSubSetupCalls, libsundials_kinsol), Cint, (KINMemPtr, Clong), kinmem, msbsetsub)
end

function KINSetMaxSubSetupCalls(kinmem, msbsetsub)
    KINSetMaxSubSetupCalls(kinmem, convert(Clong, msbsetsub))
end

function KINSetEtaForm(kinmem, etachoice::Cint)
    ccall((:KINSetEtaForm, libsundials_kinsol), Cint, (KINMemPtr, Cint), kinmem, etachoice)
end

function KINSetEtaForm(kinmem, etachoice)
    KINSetEtaForm(kinmem, convert(Cint, etachoice))
end

function KINSetEtaConstValue(kinmem, eta::realtype)
    ccall((:KINSetEtaConstValue, libsundials_kinsol), Cint, (KINMemPtr, realtype), kinmem, eta)
end

function KINSetEtaParams(kinmem, egamma::realtype, ealpha::realtype)
    ccall((:KINSetEtaParams, libsundials_kinsol), Cint, (KINMemPtr, realtype, realtype), kinmem, egamma, ealpha)
end

function KINSetResMonParams(kinmem, omegamin::realtype, omegamax::realtype)
    ccall((:KINSetResMonParams, libsundials_kinsol), Cint, (KINMemPtr, realtype, realtype), kinmem, omegamin, omegamax)
end

function KINSetResMonConstValue(kinmem, omegaconst::realtype)
    ccall((:KINSetResMonConstValue, libsundials_kinsol), Cint, (KINMemPtr, realtype), kinmem, omegaconst)
end

function KINSetNoMinEps(kinmem, noMinEps::Cint)
    ccall((:KINSetNoMinEps, libsundials_kinsol), Cint, (KINMemPtr, Cint), kinmem, noMinEps)
end

function KINSetNoMinEps(kinmem, noMinEps)
    KINSetNoMinEps(kinmem, convert(Cint, noMinEps))
end

function KINSetMaxNewtonStep(kinmem, mxnewtstep::realtype)
    ccall((:KINSetMaxNewtonStep, libsundials_kinsol), Cint, (KINMemPtr, realtype), kinmem, mxnewtstep)
end

function KINSetMaxBetaFails(kinmem, mxnbcf::Clong)
    ccall((:KINSetMaxBetaFails, libsundials_kinsol), Cint, (KINMemPtr, Clong), kinmem, mxnbcf)
end

function KINSetMaxBetaFails(kinmem, mxnbcf)
    KINSetMaxBetaFails(kinmem, convert(Clong, mxnbcf))
end

function KINSetRelErrFunc(kinmem, relfunc::realtype)
    ccall((:KINSetRelErrFunc, libsundials_kinsol), Cint, (KINMemPtr, realtype), kinmem, relfunc)
end

function KINSetFuncNormTol(kinmem, fnormtol::realtype)
    ccall((:KINSetFuncNormTol, libsundials_kinsol), Cint, (KINMemPtr, realtype), kinmem, fnormtol)
end

function KINSetScaledStepTol(kinmem, scsteptol::realtype)
    ccall((:KINSetScaledStepTol, libsundials_kinsol), Cint, (KINMemPtr, realtype), kinmem, scsteptol)
end

function KINSetConstraints(kinmem, constraints::N_Vector)
    ccall((:KINSetConstraints, libsundials_kinsol), Cint, (KINMemPtr, N_Vector), kinmem, constraints)
end

function KINSetConstraints(kinmem, constraints)
    __constraints = convert(NVector, constraints)
    KINSetConstraints(kinmem, convert(N_Vector, __constraints))
end

function KINSetSysFunc(kinmem, func::KINSysFn)
    ccall((:KINSetSysFunc, libsundials_kinsol), Cint, (KINMemPtr, KINSysFn), kinmem, func)
end

function KINSetSysFunc(kinmem, func)
    KINSetSysFunc(kinmem, KINSysFn_wrapper(func))
end

function KINGetWorkSpace(kinmem, lenrw, leniw)
    ccall((:KINGetWorkSpace, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}, Ptr{Clong}), kinmem, lenrw, leniw)
end

function KINGetNumNonlinSolvIters(kinmem, nniters)
    ccall((:KINGetNumNonlinSolvIters, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, nniters)
end

function KINGetNumFuncEvals(kinmem, nfevals)
    ccall((:KINGetNumFuncEvals, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, nfevals)
end

function KINGetNumBetaCondFails(kinmem, nbcfails)
    ccall((:KINGetNumBetaCondFails, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, nbcfails)
end

function KINGetNumBacktrackOps(kinmem, nbacktr)
    ccall((:KINGetNumBacktrackOps, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, nbacktr)
end

function KINGetFuncNorm(kinmem, fnorm)
    ccall((:KINGetFuncNorm, libsundials_kinsol), Cint, (KINMemPtr, Ptr{realtype}), kinmem, fnorm)
end

function KINGetStepLength(kinmem, steplength)
    ccall((:KINGetStepLength, libsundials_kinsol), Cint, (KINMemPtr, Ptr{realtype}), kinmem, steplength)
end

function KINGetReturnFlagName(flag::Clong)
    ccall((:KINGetReturnFlagName, libsundials_kinsol), Cstring, (Clong,), flag)
end

function KINGetReturnFlagName(flag)
    KINGetReturnFlagName(convert(Clong, flag))
end

function KINFree(kinmem)
    ccall((:KINFree, libsundials_kinsol), Cvoid, (Ref{KINMemPtr},), kinmem)
end

function KINBBDPrecInit(kinmem, Nlocal::sunindextype, mudq::sunindextype, mldq::sunindextype, mukeep::sunindextype, mlkeep::sunindextype, dq_rel_uu::realtype, gloc::KINBBDLocalFn, gcomm::KINBBDCommFn)
    ccall((:KINBBDPrecInit, libsundials_kinsol), Cint, (KINMemPtr, sunindextype, sunindextype, sunindextype, sunindextype, sunindextype, realtype, KINBBDLocalFn, KINBBDCommFn), kinmem, Nlocal, mudq, mldq, mukeep, mlkeep, dq_rel_uu, gloc, gcomm)
end

function KINBBDPrecGetWorkSpace(kinmem, lenrwBBDP, leniwBBDP)
    ccall((:KINBBDPrecGetWorkSpace, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}, Ptr{Clong}), kinmem, lenrwBBDP, leniwBBDP)
end

function KINBBDPrecGetNumGfnEvals(kinmem, ngevalsBBDP)
    ccall((:KINBBDPrecGetNumGfnEvals, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, ngevalsBBDP)
end

function KINDlsSetLinearSolver(kinmem, LS::SUNLinearSolver, A::SUNMatrix)
    ccall((:KINDlsSetLinearSolver, libsundials_kinsol), Cint, (KINMemPtr, SUNLinearSolver, SUNMatrix), kinmem, LS, A)
end

function KINDlsSetJacFn(kinmem, jac::KINDlsJacFn)
    ccall((:KINDlsSetJacFn, libsundials_kinsol), Cint, (KINMemPtr, KINDlsJacFn), kinmem, jac)
end

function KINDlsGetWorkSpace(kinmem, lenrw, leniw)
    ccall((:KINDlsGetWorkSpace, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}, Ptr{Clong}), kinmem, lenrw, leniw)
end

function KINDlsGetNumJacEvals(kinmem, njevals)
    ccall((:KINDlsGetNumJacEvals, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, njevals)
end

function KINDlsGetNumFuncEvals(kinmem, nfevals)
    ccall((:KINDlsGetNumFuncEvals, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, nfevals)
end

function KINDlsGetLastFlag(kinmem, flag)
    ccall((:KINDlsGetLastFlag, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, flag)
end

function KINDlsGetReturnFlagName(flag::Clong)
    ccall((:KINDlsGetReturnFlagName, libsundials_kinsol), Cstring, (Clong,), flag)
end

function KINDlsGetReturnFlagName(flag)
    KINDlsGetReturnFlagName(convert(Clong, flag))
end

function KINSetLinearSolver(kinmem, LS::SUNLinearSolver, A::SUNMatrix)
    ccall((:KINSetLinearSolver, libsundials_kinsol), Cint, (KINMemPtr, SUNLinearSolver, SUNMatrix), kinmem, LS, A)
end

function KINSetJacFn(kinmem, jac::KINLsJacFn)
    ccall((:KINSetJacFn, libsundials_kinsol), Cint, (KINMemPtr, KINLsJacFn), kinmem, jac)
end

function KINSetPreconditioner(kinmem, psetup::KINLsPrecSetupFn, psolve::KINLsPrecSolveFn)
    ccall((:KINSetPreconditioner, libsundials_kinsol), Cint, (KINMemPtr, KINLsPrecSetupFn, KINLsPrecSolveFn), kinmem, psetup, psolve)
end

function KINSetJacTimesVecFn(kinmem, jtv::KINLsJacTimesVecFn)
    ccall((:KINSetJacTimesVecFn, libsundials_kinsol), Cint, (KINMemPtr, KINLsJacTimesVecFn), kinmem, jtv)
end

function KINGetLinWorkSpace(kinmem, lenrwLS, leniwLS)
    ccall((:KINGetLinWorkSpace, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}, Ptr{Clong}), kinmem, lenrwLS, leniwLS)
end

function KINGetNumJacEvals(kinmem, njevals)
    ccall((:KINGetNumJacEvals, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, njevals)
end

function KINGetNumLinFuncEvals(kinmem, nfevals)
    ccall((:KINGetNumLinFuncEvals, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, nfevals)
end

function KINGetNumPrecEvals(kinmem, npevals)
    ccall((:KINGetNumPrecEvals, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, npevals)
end

function KINGetNumPrecSolves(kinmem, npsolves)
    ccall((:KINGetNumPrecSolves, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, npsolves)
end

function KINGetNumLinIters(kinmem, nliters)
    ccall((:KINGetNumLinIters, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, nliters)
end

function KINGetNumLinConvFails(kinmem, nlcfails)
    ccall((:KINGetNumLinConvFails, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, nlcfails)
end

function KINGetNumJtimesEvals(kinmem, njvevals)
    ccall((:KINGetNumJtimesEvals, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, njvevals)
end

function KINGetLastLinFlag(kinmem, flag)
    ccall((:KINGetLastLinFlag, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, flag)
end

function KINGetLinReturnFlagName(flag::Clong)
    ccall((:KINGetLinReturnFlagName, libsundials_kinsol), Cstring, (Clong,), flag)
end

function KINGetLinReturnFlagName(flag)
    KINGetLinReturnFlagName(convert(Clong, flag))
end

function KINSpilsSetLinearSolver(kinmem, LS::SUNLinearSolver)
    ccall((:KINSpilsSetLinearSolver, libsundials_kinsol), Cint, (KINMemPtr, SUNLinearSolver), kinmem, LS)
end

function KINSpilsSetPreconditioner(kinmem, psetup::KINSpilsPrecSetupFn, psolve::KINSpilsPrecSolveFn)
    ccall((:KINSpilsSetPreconditioner, libsundials_kinsol), Cint, (KINMemPtr, KINSpilsPrecSetupFn, KINSpilsPrecSolveFn), kinmem, psetup, psolve)
end

function KINSpilsSetJacTimesVecFn(kinmem, jtv::KINSpilsJacTimesVecFn)
    ccall((:KINSpilsSetJacTimesVecFn, libsundials_kinsol), Cint, (KINMemPtr, KINSpilsJacTimesVecFn), kinmem, jtv)
end

function KINSpilsGetWorkSpace(kinmem, lenrwLS, leniwLS)
    ccall((:KINSpilsGetWorkSpace, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}, Ptr{Clong}), kinmem, lenrwLS, leniwLS)
end

function KINSpilsGetNumPrecEvals(kinmem, npevals)
    ccall((:KINSpilsGetNumPrecEvals, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, npevals)
end

function KINSpilsGetNumPrecSolves(kinmem, npsolves)
    ccall((:KINSpilsGetNumPrecSolves, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, npsolves)
end

function KINSpilsGetNumLinIters(kinmem, nliters)
    ccall((:KINSpilsGetNumLinIters, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, nliters)
end

function KINSpilsGetNumConvFails(kinmem, nlcfails)
    ccall((:KINSpilsGetNumConvFails, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, nlcfails)
end

function KINSpilsGetNumJtimesEvals(kinmem, njvevals)
    ccall((:KINSpilsGetNumJtimesEvals, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, njvevals)
end

function KINSpilsGetNumFuncEvals(kinmem, nfevals)
    ccall((:KINSpilsGetNumFuncEvals, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, nfevals)
end

function KINSpilsGetLastFlag(kinmem, flag)
    ccall((:KINSpilsGetLastFlag, libsundials_kinsol), Cint, (KINMemPtr, Ptr{Clong}), kinmem, flag)
end

function KINSpilsGetReturnFlagName(flag::Clong)
    ccall((:KINSpilsGetReturnFlagName, libsundials_kinsol), Cstring, (Clong,), flag)
end

function KINSpilsGetReturnFlagName(flag)
    KINSpilsGetReturnFlagName(convert(Clong, flag))
end

function N_VNew_ManyVector(num_subvectors::sunindextype, vec_array)
    ccall((:N_VNew_ManyVector, libsundials_nvecserial), N_Vector, (sunindextype, Ptr{N_Vector}), num_subvectors, vec_array)
end

function N_VGetSubvector_ManyVector(v::N_Vector, vec_num::sunindextype)
    ccall((:N_VGetSubvector_ManyVector, libsundials_nvecserial), N_Vector, (N_Vector, sunindextype), v, vec_num)
end

function N_VGetSubvector_ManyVector(v, vec_num)
    __v = convert(NVector, v)
    N_VGetSubvector_ManyVector(convert(N_Vector, __v), vec_num)
end

function N_VGetSubvectorArrayPointer_ManyVector(v::N_Vector, vec_num::sunindextype)
    ccall((:N_VGetSubvectorArrayPointer_ManyVector, libsundials_nvecserial), Ptr{realtype}, (N_Vector, sunindextype), v, vec_num)
end

function N_VGetSubvectorArrayPointer_ManyVector(v, vec_num)
    __v = convert(NVector, v)
    N_VGetSubvectorArrayPointer_ManyVector(convert(N_Vector, __v), vec_num)
end

function N_VSetSubvectorArrayPointer_ManyVector(v_data, v::N_Vector, vec_num::sunindextype)
    ccall((:N_VSetSubvectorArrayPointer_ManyVector, libsundials_nvecserial), Cint, (Ptr{realtype}, N_Vector, sunindextype), v_data, v, vec_num)
end

function N_VSetSubvectorArrayPointer_ManyVector(v_data, v, vec_num)
    __v = convert(NVector, v)
    N_VSetSubvectorArrayPointer_ManyVector(v_data, convert(N_Vector, __v), vec_num)
end

function N_VGetNumSubvectors_ManyVector(v::N_Vector)
    ccall((:N_VGetNumSubvectors_ManyVector, libsundials_nvecserial), sunindextype, (N_Vector,), v)
end

function N_VGetNumSubvectors_ManyVector(v)
    __v = convert(NVector, v)
    N_VGetNumSubvectors_ManyVector(convert(N_Vector, __v))
end

function N_VGetVectorID_ManyVector(v::N_Vector)
    ccall((:N_VGetVectorID_ManyVector, libsundials_nvecserial), N_Vector_ID, (N_Vector,), v)
end

function N_VGetVectorID_ManyVector(v)
    __v = convert(NVector, v)
    N_VGetVectorID_ManyVector(convert(N_Vector, __v))
end

function N_VCloneEmpty_ManyVector(w::N_Vector)
    ccall((:N_VCloneEmpty_ManyVector, libsundials_nvecserial), N_Vector, (N_Vector,), w)
end

function N_VCloneEmpty_ManyVector(w)
    __w = convert(NVector, w)
    N_VCloneEmpty_ManyVector(convert(N_Vector, __w))
end

function N_VClone_ManyVector(w::N_Vector)
    ccall((:N_VClone_ManyVector, libsundials_nvecserial), N_Vector, (N_Vector,), w)
end

function N_VClone_ManyVector(w)
    __w = convert(NVector, w)
    N_VClone_ManyVector(convert(N_Vector, __w))
end

function N_VDestroy_ManyVector(v::N_Vector)
    ccall((:N_VDestroy_ManyVector, libsundials_nvecserial), Cvoid, (N_Vector,), v)
end

function N_VDestroy_ManyVector(v)
    __v = convert(NVector, v)
    N_VDestroy_ManyVector(convert(N_Vector, __v))
end

function N_VSpace_ManyVector(v::N_Vector, lrw, liw)
    ccall((:N_VSpace_ManyVector, libsundials_nvecserial), Cvoid, (N_Vector, Ptr{sunindextype}, Ptr{sunindextype}), v, lrw, liw)
end

function N_VSpace_ManyVector(v, lrw, liw)
    __v = convert(NVector, v)
    N_VSpace_ManyVector(convert(N_Vector, __v), lrw, liw)
end

function N_VGetLength_ManyVector(v::N_Vector)
    ccall((:N_VGetLength_ManyVector, libsundials_nvecserial), sunindextype, (N_Vector,), v)
end

function N_VGetLength_ManyVector(v)
    __v = convert(NVector, v)
    N_VGetLength_ManyVector(convert(N_Vector, __v))
end

function N_VLinearSum_ManyVector(a::realtype, x::N_Vector, b::realtype, y::N_Vector, z::N_Vector)
    ccall((:N_VLinearSum_ManyVector, libsundials_nvecserial), Cvoid, (realtype, N_Vector, realtype, N_Vector, N_Vector), a, x, b, y, z)
end

function N_VLinearSum_ManyVector(a, x, b, y, z)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    __z = convert(NVector, z)
    N_VLinearSum_ManyVector(a, convert(N_Vector, __x), b, convert(N_Vector, __y), convert(N_Vector, __z))
end

function N_VConst_ManyVector(c::realtype, z::N_Vector)
    ccall((:N_VConst_ManyVector, libsundials_nvecserial), Cvoid, (realtype, N_Vector), c, z)
end

function N_VConst_ManyVector(c, z)
    __z = convert(NVector, z)
    N_VConst_ManyVector(c, convert(N_Vector, __z))
end

function N_VProd_ManyVector(x::N_Vector, y::N_Vector, z::N_Vector)
    ccall((:N_VProd_ManyVector, libsundials_nvecserial), Cvoid, (N_Vector, N_Vector, N_Vector), x, y, z)
end

function N_VProd_ManyVector(x, y, z)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    __z = convert(NVector, z)
    N_VProd_ManyVector(convert(N_Vector, __x), convert(N_Vector, __y), convert(N_Vector, __z))
end

function N_VDiv_ManyVector(x::N_Vector, y::N_Vector, z::N_Vector)
    ccall((:N_VDiv_ManyVector, libsundials_nvecserial), Cvoid, (N_Vector, N_Vector, N_Vector), x, y, z)
end

function N_VDiv_ManyVector(x, y, z)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    __z = convert(NVector, z)
    N_VDiv_ManyVector(convert(N_Vector, __x), convert(N_Vector, __y), convert(N_Vector, __z))
end

function N_VScale_ManyVector(c::realtype, x::N_Vector, z::N_Vector)
    ccall((:N_VScale_ManyVector, libsundials_nvecserial), Cvoid, (realtype, N_Vector, N_Vector), c, x, z)
end

function N_VScale_ManyVector(c, x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VScale_ManyVector(c, convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VAbs_ManyVector(x::N_Vector, z::N_Vector)
    ccall((:N_VAbs_ManyVector, libsundials_nvecserial), Cvoid, (N_Vector, N_Vector), x, z)
end

function N_VAbs_ManyVector(x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VAbs_ManyVector(convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VInv_ManyVector(x::N_Vector, z::N_Vector)
    ccall((:N_VInv_ManyVector, libsundials_nvecserial), Cvoid, (N_Vector, N_Vector), x, z)
end

function N_VInv_ManyVector(x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VInv_ManyVector(convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VAddConst_ManyVector(x::N_Vector, b::realtype, z::N_Vector)
    ccall((:N_VAddConst_ManyVector, libsundials_nvecserial), Cvoid, (N_Vector, realtype, N_Vector), x, b, z)
end

function N_VAddConst_ManyVector(x, b, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VAddConst_ManyVector(convert(N_Vector, __x), b, convert(N_Vector, __z))
end

function N_VWrmsNorm_ManyVector(x::N_Vector, w::N_Vector)
    ccall((:N_VWrmsNorm_ManyVector, libsundials_nvecserial), realtype, (N_Vector, N_Vector), x, w)
end

function N_VWrmsNorm_ManyVector(x, w)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    N_VWrmsNorm_ManyVector(convert(N_Vector, __x), convert(N_Vector, __w))
end

function N_VWrmsNormMask_ManyVector(x::N_Vector, w::N_Vector, id::N_Vector)
    ccall((:N_VWrmsNormMask_ManyVector, libsundials_nvecserial), realtype, (N_Vector, N_Vector, N_Vector), x, w, id)
end

function N_VWrmsNormMask_ManyVector(x, w, id)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    __id = convert(NVector, id)
    N_VWrmsNormMask_ManyVector(convert(N_Vector, __x), convert(N_Vector, __w), convert(N_Vector, __id))
end

function N_VWL2Norm_ManyVector(x::N_Vector, w::N_Vector)
    ccall((:N_VWL2Norm_ManyVector, libsundials_nvecserial), realtype, (N_Vector, N_Vector), x, w)
end

function N_VWL2Norm_ManyVector(x, w)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    N_VWL2Norm_ManyVector(convert(N_Vector, __x), convert(N_Vector, __w))
end

function N_VCompare_ManyVector(c::realtype, x::N_Vector, z::N_Vector)
    ccall((:N_VCompare_ManyVector, libsundials_nvecserial), Cvoid, (realtype, N_Vector, N_Vector), c, x, z)
end

function N_VCompare_ManyVector(c, x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VCompare_ManyVector(c, convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VLinearCombination_ManyVector(nvec::Cint, c, V, z::N_Vector)
    ccall((:N_VLinearCombination_ManyVector, libsundials_nvecserial), Cint, (Cint, Ptr{realtype}, Ptr{N_Vector}, N_Vector), nvec, c, V, z)
end

function N_VLinearCombination_ManyVector(nvec, c, V, z)
    __z = convert(NVector, z)
    N_VLinearCombination_ManyVector(convert(Cint, nvec), c, V, convert(N_Vector, __z))
end

function N_VScaleAddMulti_ManyVector(nvec::Cint, a, x::N_Vector, Y, Z)
    ccall((:N_VScaleAddMulti_ManyVector, libsundials_nvecserial), Cint, (Cint, Ptr{realtype}, N_Vector, Ptr{N_Vector}, Ptr{N_Vector}), nvec, a, x, Y, Z)
end

function N_VScaleAddMulti_ManyVector(nvec, a, x, Y, Z)
    __x = convert(NVector, x)
    N_VScaleAddMulti_ManyVector(convert(Cint, nvec), a, convert(N_Vector, __x), Y, Z)
end

function N_VDotProdMulti_ManyVector(nvec::Cint, x::N_Vector, Y, dotprods)
    ccall((:N_VDotProdMulti_ManyVector, libsundials_nvecserial), Cint, (Cint, N_Vector, Ptr{N_Vector}, Ptr{realtype}), nvec, x, Y, dotprods)
end

function N_VDotProdMulti_ManyVector(nvec, x, Y, dotprods)
    __x = convert(NVector, x)
    N_VDotProdMulti_ManyVector(convert(Cint, nvec), convert(N_Vector, __x), Y, dotprods)
end

function N_VLinearSumVectorArray_ManyVector(nvec::Cint, a::realtype, X, b::realtype, Y, Z)
    ccall((:N_VLinearSumVectorArray_ManyVector, libsundials_nvecserial), Cint, (Cint, realtype, Ptr{N_Vector}, realtype, Ptr{N_Vector}, Ptr{N_Vector}), nvec, a, X, b, Y, Z)
end

function N_VLinearSumVectorArray_ManyVector(nvec, a, X, b, Y, Z)
    N_VLinearSumVectorArray_ManyVector(convert(Cint, nvec), a, X, b, Y, Z)
end

function N_VScaleVectorArray_ManyVector(nvec::Cint, c, X, Z)
    ccall((:N_VScaleVectorArray_ManyVector, libsundials_nvecserial), Cint, (Cint, Ptr{realtype}, Ptr{N_Vector}, Ptr{N_Vector}), nvec, c, X, Z)
end

function N_VScaleVectorArray_ManyVector(nvec, c, X, Z)
    N_VScaleVectorArray_ManyVector(convert(Cint, nvec), c, X, Z)
end

function N_VConstVectorArray_ManyVector(nvecs::Cint, c::realtype, Z)
    ccall((:N_VConstVectorArray_ManyVector, libsundials_nvecserial), Cint, (Cint, realtype, Ptr{N_Vector}), nvecs, c, Z)
end

function N_VConstVectorArray_ManyVector(nvecs, c, Z)
    N_VConstVectorArray_ManyVector(convert(Cint, nvecs), c, Z)
end

function N_VWrmsNormVectorArray_ManyVector(nvecs::Cint, X, W, nrm)
    ccall((:N_VWrmsNormVectorArray_ManyVector, libsundials_nvecserial), Cint, (Cint, Ptr{N_Vector}, Ptr{N_Vector}, Ptr{realtype}), nvecs, X, W, nrm)
end

function N_VWrmsNormVectorArray_ManyVector(nvecs, X, W, nrm)
    N_VWrmsNormVectorArray_ManyVector(convert(Cint, nvecs), X, W, nrm)
end

function N_VWrmsNormMaskVectorArray_ManyVector(nvec::Cint, X, W, id::N_Vector, nrm)
    ccall((:N_VWrmsNormMaskVectorArray_ManyVector, libsundials_nvecserial), Cint, (Cint, Ptr{N_Vector}, Ptr{N_Vector}, N_Vector, Ptr{realtype}), nvec, X, W, id, nrm)
end

function N_VWrmsNormMaskVectorArray_ManyVector(nvec, X, W, id, nrm)
    __id = convert(NVector, id)
    N_VWrmsNormMaskVectorArray_ManyVector(convert(Cint, nvec), X, W, convert(N_Vector, __id), nrm)
end

function N_VDotProdLocal_ManyVector(x::N_Vector, y::N_Vector)
    ccall((:N_VDotProdLocal_ManyVector, libsundials_nvecserial), realtype, (N_Vector, N_Vector), x, y)
end

function N_VDotProdLocal_ManyVector(x, y)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    N_VDotProdLocal_ManyVector(convert(N_Vector, __x), convert(N_Vector, __y))
end

function N_VMaxNormLocal_ManyVector(x::N_Vector)
    ccall((:N_VMaxNormLocal_ManyVector, libsundials_nvecserial), realtype, (N_Vector,), x)
end

function N_VMaxNormLocal_ManyVector(x)
    __x = convert(NVector, x)
    N_VMaxNormLocal_ManyVector(convert(N_Vector, __x))
end

function N_VMinLocal_ManyVector(x::N_Vector)
    ccall((:N_VMinLocal_ManyVector, libsundials_nvecserial), realtype, (N_Vector,), x)
end

function N_VMinLocal_ManyVector(x)
    __x = convert(NVector, x)
    N_VMinLocal_ManyVector(convert(N_Vector, __x))
end

function N_VL1NormLocal_ManyVector(x::N_Vector)
    ccall((:N_VL1NormLocal_ManyVector, libsundials_nvecserial), realtype, (N_Vector,), x)
end

function N_VL1NormLocal_ManyVector(x)
    __x = convert(NVector, x)
    N_VL1NormLocal_ManyVector(convert(N_Vector, __x))
end

function N_VWSqrSumLocal_ManyVector(x::N_Vector, w::N_Vector)
    ccall((:N_VWSqrSumLocal_ManyVector, libsundials_nvecserial), realtype, (N_Vector, N_Vector), x, w)
end

function N_VWSqrSumLocal_ManyVector(x, w)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    N_VWSqrSumLocal_ManyVector(convert(N_Vector, __x), convert(N_Vector, __w))
end

function N_VWSqrSumMaskLocal_ManyVector(x::N_Vector, w::N_Vector, id::N_Vector)
    ccall((:N_VWSqrSumMaskLocal_ManyVector, libsundials_nvecserial), realtype, (N_Vector, N_Vector, N_Vector), x, w, id)
end

function N_VWSqrSumMaskLocal_ManyVector(x, w, id)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    __id = convert(NVector, id)
    N_VWSqrSumMaskLocal_ManyVector(convert(N_Vector, __x), convert(N_Vector, __w), convert(N_Vector, __id))
end

function N_VInvTestLocal_ManyVector(x::N_Vector, z::N_Vector)
    ccall((:N_VInvTestLocal_ManyVector, libsundials_nvecserial), Cint, (N_Vector, N_Vector), x, z)
end

function N_VInvTestLocal_ManyVector(x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VInvTestLocal_ManyVector(convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VConstrMaskLocal_ManyVector(c::N_Vector, x::N_Vector, m::N_Vector)
    ccall((:N_VConstrMaskLocal_ManyVector, libsundials_nvecserial), Cint, (N_Vector, N_Vector, N_Vector), c, x, m)
end

function N_VConstrMaskLocal_ManyVector(c, x, m)
    __c = convert(NVector, c)
    __x = convert(NVector, x)
    __m = convert(NVector, m)
    N_VConstrMaskLocal_ManyVector(convert(N_Vector, __c), convert(N_Vector, __x), convert(N_Vector, __m))
end

function N_VMinQuotientLocal_ManyVector(num::N_Vector, denom::N_Vector)
    ccall((:N_VMinQuotientLocal_ManyVector, libsundials_nvecserial), realtype, (N_Vector, N_Vector), num, denom)
end

function N_VMinQuotientLocal_ManyVector(num, denom)
    __num = convert(NVector, num)
    __denom = convert(NVector, denom)
    N_VMinQuotientLocal_ManyVector(convert(N_Vector, __num), convert(N_Vector, __denom))
end

function N_VEnableFusedOps_ManyVector(v::N_Vector, tf::Cint)
    ccall((:N_VEnableFusedOps_ManyVector, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableFusedOps_ManyVector(v, tf)
    __v = convert(NVector, v)
    N_VEnableFusedOps_ManyVector(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableLinearCombination_ManyVector(v::N_Vector, tf::Cint)
    ccall((:N_VEnableLinearCombination_ManyVector, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableLinearCombination_ManyVector(v, tf)
    __v = convert(NVector, v)
    N_VEnableLinearCombination_ManyVector(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableScaleAddMulti_ManyVector(v::N_Vector, tf::Cint)
    ccall((:N_VEnableScaleAddMulti_ManyVector, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableScaleAddMulti_ManyVector(v, tf)
    __v = convert(NVector, v)
    N_VEnableScaleAddMulti_ManyVector(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableDotProdMulti_ManyVector(v::N_Vector, tf::Cint)
    ccall((:N_VEnableDotProdMulti_ManyVector, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableDotProdMulti_ManyVector(v, tf)
    __v = convert(NVector, v)
    N_VEnableDotProdMulti_ManyVector(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableLinearSumVectorArray_ManyVector(v::N_Vector, tf::Cint)
    ccall((:N_VEnableLinearSumVectorArray_ManyVector, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableLinearSumVectorArray_ManyVector(v, tf)
    __v = convert(NVector, v)
    N_VEnableLinearSumVectorArray_ManyVector(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableScaleVectorArray_ManyVector(v::N_Vector, tf::Cint)
    ccall((:N_VEnableScaleVectorArray_ManyVector, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableScaleVectorArray_ManyVector(v, tf)
    __v = convert(NVector, v)
    N_VEnableScaleVectorArray_ManyVector(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableConstVectorArray_ManyVector(v::N_Vector, tf::Cint)
    ccall((:N_VEnableConstVectorArray_ManyVector, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableConstVectorArray_ManyVector(v, tf)
    __v = convert(NVector, v)
    N_VEnableConstVectorArray_ManyVector(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableWrmsNormVectorArray_ManyVector(v::N_Vector, tf::Cint)
    ccall((:N_VEnableWrmsNormVectorArray_ManyVector, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableWrmsNormVectorArray_ManyVector(v, tf)
    __v = convert(NVector, v)
    N_VEnableWrmsNormVectorArray_ManyVector(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableWrmsNormMaskVectorArray_ManyVector(v::N_Vector, tf::Cint)
    ccall((:N_VEnableWrmsNormMaskVectorArray_ManyVector, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableWrmsNormMaskVectorArray_ManyVector(v, tf)
    __v = convert(NVector, v)
    N_VEnableWrmsNormMaskVectorArray_ManyVector(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VNew_Serial(vec_length::sunindextype)
    ccall((:N_VNew_Serial, libsundials_nvecserial), N_Vector, (sunindextype,), vec_length)
end

function N_VNewEmpty_Serial(vec_length::sunindextype)
    ccall((:N_VNewEmpty_Serial, libsundials_nvecserial), N_Vector, (sunindextype,), vec_length)
end

function N_VMake_Serial(vec_length::sunindextype, v_data)
    ccall((:N_VMake_Serial, libsundials_nvecserial), N_Vector, (sunindextype, Ptr{realtype}), vec_length, v_data)
end

function N_VCloneVectorArray_Serial(count::Cint, w::N_Vector)
    ccall((:N_VCloneVectorArray_Serial, libsundials_nvecserial), Ptr{N_Vector}, (Cint, N_Vector), count, w)
end

function N_VCloneVectorArray_Serial(count, w)
    __w = convert(NVector, w)
    N_VCloneVectorArray_Serial(convert(Cint, count), convert(N_Vector, __w))
end

function N_VCloneVectorArrayEmpty_Serial(count::Cint, w::N_Vector)
    ccall((:N_VCloneVectorArrayEmpty_Serial, libsundials_nvecserial), Ptr{N_Vector}, (Cint, N_Vector), count, w)
end

function N_VCloneVectorArrayEmpty_Serial(count, w)
    __w = convert(NVector, w)
    N_VCloneVectorArrayEmpty_Serial(convert(Cint, count), convert(N_Vector, __w))
end

function N_VDestroyVectorArray_Serial(vs, count::Cint)
    ccall((:N_VDestroyVectorArray_Serial, libsundials_nvecserial), Cvoid, (Ptr{N_Vector}, Cint), vs, count)
end

function N_VDestroyVectorArray_Serial(vs, count)
    N_VDestroyVectorArray_Serial(vs, convert(Cint, count))
end

function N_VGetLength_Serial(v::N_Vector)
    ccall((:N_VGetLength_Serial, libsundials_nvecserial), sunindextype, (N_Vector,), v)
end

function N_VGetLength_Serial(v)
    __v = convert(NVector, v)
    N_VGetLength_Serial(convert(N_Vector, __v))
end

function N_VPrint_Serial(v::N_Vector)
    ccall((:N_VPrint_Serial, libsundials_nvecserial), Cvoid, (N_Vector,), v)
end

function N_VPrint_Serial(v)
    __v = convert(NVector, v)
    N_VPrint_Serial(convert(N_Vector, __v))
end

function N_VPrintFile_Serial(v::N_Vector, outfile)
    ccall((:N_VPrintFile_Serial, libsundials_nvecserial), Cvoid, (N_Vector, Ptr{Libc.FILE}), v, outfile)
end

function N_VPrintFile_Serial(v, outfile)
    __v = convert(NVector, v)
    N_VPrintFile_Serial(convert(N_Vector, __v), outfile)
end

function N_VGetVectorID_Serial(v::N_Vector)
    ccall((:N_VGetVectorID_Serial, libsundials_nvecserial), N_Vector_ID, (N_Vector,), v)
end

function N_VGetVectorID_Serial(v)
    __v = convert(NVector, v)
    N_VGetVectorID_Serial(convert(N_Vector, __v))
end

function N_VCloneEmpty_Serial(w::N_Vector)
    ccall((:N_VCloneEmpty_Serial, libsundials_nvecserial), N_Vector, (N_Vector,), w)
end

function N_VCloneEmpty_Serial(w)
    __w = convert(NVector, w)
    N_VCloneEmpty_Serial(convert(N_Vector, __w))
end

function N_VClone_Serial(w::N_Vector)
    ccall((:N_VClone_Serial, libsundials_nvecserial), N_Vector, (N_Vector,), w)
end

function N_VClone_Serial(w)
    __w = convert(NVector, w)
    N_VClone_Serial(convert(N_Vector, __w))
end

function N_VDestroy_Serial(v::N_Vector)
    ccall((:N_VDestroy_Serial, libsundials_nvecserial), Cvoid, (N_Vector,), v)
end

function N_VDestroy_Serial(v)
    __v = convert(NVector, v)
    N_VDestroy_Serial(convert(N_Vector, __v))
end

function N_VSpace_Serial(v::N_Vector, lrw, liw)
    ccall((:N_VSpace_Serial, libsundials_nvecserial), Cvoid, (N_Vector, Ptr{sunindextype}, Ptr{sunindextype}), v, lrw, liw)
end

function N_VSpace_Serial(v, lrw, liw)
    __v = convert(NVector, v)
    N_VSpace_Serial(convert(N_Vector, __v), lrw, liw)
end

function N_VGetArrayPointer_Serial(v::N_Vector)
    ccall((:N_VGetArrayPointer_Serial, libsundials_nvecserial), Ptr{realtype}, (N_Vector,), v)
end

function N_VGetArrayPointer_Serial(v)
    __v = convert(NVector, v)
    N_VGetArrayPointer_Serial(convert(N_Vector, __v))
end

function N_VSetArrayPointer_Serial(v_data, v::N_Vector)
    ccall((:N_VSetArrayPointer_Serial, libsundials_nvecserial), Cvoid, (Ptr{realtype}, N_Vector), v_data, v)
end

function N_VSetArrayPointer_Serial(v_data, v)
    __v = convert(NVector, v)
    N_VSetArrayPointer_Serial(v_data, convert(N_Vector, __v))
end

function N_VLinearSum_Serial(a::realtype, x::N_Vector, b::realtype, y::N_Vector, z::N_Vector)
    ccall((:N_VLinearSum_Serial, libsundials_nvecserial), Cvoid, (realtype, N_Vector, realtype, N_Vector, N_Vector), a, x, b, y, z)
end

function N_VLinearSum_Serial(a, x, b, y, z)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    __z = convert(NVector, z)
    N_VLinearSum_Serial(a, convert(N_Vector, __x), b, convert(N_Vector, __y), convert(N_Vector, __z))
end

function N_VConst_Serial(c::realtype, z::N_Vector)
    ccall((:N_VConst_Serial, libsundials_nvecserial), Cvoid, (realtype, N_Vector), c, z)
end

function N_VConst_Serial(c, z)
    __z = convert(NVector, z)
    N_VConst_Serial(c, convert(N_Vector, __z))
end

function N_VProd_Serial(x::N_Vector, y::N_Vector, z::N_Vector)
    ccall((:N_VProd_Serial, libsundials_nvecserial), Cvoid, (N_Vector, N_Vector, N_Vector), x, y, z)
end

function N_VProd_Serial(x, y, z)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    __z = convert(NVector, z)
    N_VProd_Serial(convert(N_Vector, __x), convert(N_Vector, __y), convert(N_Vector, __z))
end

function N_VDiv_Serial(x::N_Vector, y::N_Vector, z::N_Vector)
    ccall((:N_VDiv_Serial, libsundials_nvecserial), Cvoid, (N_Vector, N_Vector, N_Vector), x, y, z)
end

function N_VDiv_Serial(x, y, z)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    __z = convert(NVector, z)
    N_VDiv_Serial(convert(N_Vector, __x), convert(N_Vector, __y), convert(N_Vector, __z))
end

function N_VScale_Serial(c::realtype, x::N_Vector, z::N_Vector)
    ccall((:N_VScale_Serial, libsundials_nvecserial), Cvoid, (realtype, N_Vector, N_Vector), c, x, z)
end

function N_VScale_Serial(c, x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VScale_Serial(c, convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VAbs_Serial(x::N_Vector, z::N_Vector)
    ccall((:N_VAbs_Serial, libsundials_nvecserial), Cvoid, (N_Vector, N_Vector), x, z)
end

function N_VAbs_Serial(x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VAbs_Serial(convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VInv_Serial(x::N_Vector, z::N_Vector)
    ccall((:N_VInv_Serial, libsundials_nvecserial), Cvoid, (N_Vector, N_Vector), x, z)
end

function N_VInv_Serial(x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VInv_Serial(convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VAddConst_Serial(x::N_Vector, b::realtype, z::N_Vector)
    ccall((:N_VAddConst_Serial, libsundials_nvecserial), Cvoid, (N_Vector, realtype, N_Vector), x, b, z)
end

function N_VAddConst_Serial(x, b, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VAddConst_Serial(convert(N_Vector, __x), b, convert(N_Vector, __z))
end

function N_VDotProd_Serial(x::N_Vector, y::N_Vector)
    ccall((:N_VDotProd_Serial, libsundials_nvecserial), realtype, (N_Vector, N_Vector), x, y)
end

function N_VDotProd_Serial(x, y)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    N_VDotProd_Serial(convert(N_Vector, __x), convert(N_Vector, __y))
end

function N_VMaxNorm_Serial(x::N_Vector)
    ccall((:N_VMaxNorm_Serial, libsundials_nvecserial), realtype, (N_Vector,), x)
end

function N_VMaxNorm_Serial(x)
    __x = convert(NVector, x)
    N_VMaxNorm_Serial(convert(N_Vector, __x))
end

function N_VWrmsNorm_Serial(x::N_Vector, w::N_Vector)
    ccall((:N_VWrmsNorm_Serial, libsundials_nvecserial), realtype, (N_Vector, N_Vector), x, w)
end

function N_VWrmsNorm_Serial(x, w)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    N_VWrmsNorm_Serial(convert(N_Vector, __x), convert(N_Vector, __w))
end

function N_VWrmsNormMask_Serial(x::N_Vector, w::N_Vector, id::N_Vector)
    ccall((:N_VWrmsNormMask_Serial, libsundials_nvecserial), realtype, (N_Vector, N_Vector, N_Vector), x, w, id)
end

function N_VWrmsNormMask_Serial(x, w, id)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    __id = convert(NVector, id)
    N_VWrmsNormMask_Serial(convert(N_Vector, __x), convert(N_Vector, __w), convert(N_Vector, __id))
end

function N_VMin_Serial(x::N_Vector)
    ccall((:N_VMin_Serial, libsundials_nvecserial), realtype, (N_Vector,), x)
end

function N_VMin_Serial(x)
    __x = convert(NVector, x)
    N_VMin_Serial(convert(N_Vector, __x))
end

function N_VWL2Norm_Serial(x::N_Vector, w::N_Vector)
    ccall((:N_VWL2Norm_Serial, libsundials_nvecserial), realtype, (N_Vector, N_Vector), x, w)
end

function N_VWL2Norm_Serial(x, w)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    N_VWL2Norm_Serial(convert(N_Vector, __x), convert(N_Vector, __w))
end

function N_VL1Norm_Serial(x::N_Vector)
    ccall((:N_VL1Norm_Serial, libsundials_nvecserial), realtype, (N_Vector,), x)
end

function N_VL1Norm_Serial(x)
    __x = convert(NVector, x)
    N_VL1Norm_Serial(convert(N_Vector, __x))
end

function N_VCompare_Serial(c::realtype, x::N_Vector, z::N_Vector)
    ccall((:N_VCompare_Serial, libsundials_nvecserial), Cvoid, (realtype, N_Vector, N_Vector), c, x, z)
end

function N_VCompare_Serial(c, x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VCompare_Serial(c, convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VInvTest_Serial(x::N_Vector, z::N_Vector)
    ccall((:N_VInvTest_Serial, libsundials_nvecserial), Cint, (N_Vector, N_Vector), x, z)
end

function N_VInvTest_Serial(x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VInvTest_Serial(convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VConstrMask_Serial(c::N_Vector, x::N_Vector, m::N_Vector)
    ccall((:N_VConstrMask_Serial, libsundials_nvecserial), Cint, (N_Vector, N_Vector, N_Vector), c, x, m)
end

function N_VConstrMask_Serial(c, x, m)
    __c = convert(NVector, c)
    __x = convert(NVector, x)
    __m = convert(NVector, m)
    N_VConstrMask_Serial(convert(N_Vector, __c), convert(N_Vector, __x), convert(N_Vector, __m))
end

function N_VMinQuotient_Serial(num::N_Vector, denom::N_Vector)
    ccall((:N_VMinQuotient_Serial, libsundials_nvecserial), realtype, (N_Vector, N_Vector), num, denom)
end

function N_VMinQuotient_Serial(num, denom)
    __num = convert(NVector, num)
    __denom = convert(NVector, denom)
    N_VMinQuotient_Serial(convert(N_Vector, __num), convert(N_Vector, __denom))
end

function N_VLinearCombination_Serial(nvec::Cint, c, V, z::N_Vector)
    ccall((:N_VLinearCombination_Serial, libsundials_nvecserial), Cint, (Cint, Ptr{realtype}, Ptr{N_Vector}, N_Vector), nvec, c, V, z)
end

function N_VLinearCombination_Serial(nvec, c, V, z)
    __z = convert(NVector, z)
    N_VLinearCombination_Serial(convert(Cint, nvec), c, V, convert(N_Vector, __z))
end

function N_VScaleAddMulti_Serial(nvec::Cint, a, x::N_Vector, Y, Z)
    ccall((:N_VScaleAddMulti_Serial, libsundials_nvecserial), Cint, (Cint, Ptr{realtype}, N_Vector, Ptr{N_Vector}, Ptr{N_Vector}), nvec, a, x, Y, Z)
end

function N_VScaleAddMulti_Serial(nvec, a, x, Y, Z)
    __x = convert(NVector, x)
    N_VScaleAddMulti_Serial(convert(Cint, nvec), a, convert(N_Vector, __x), Y, Z)
end

function N_VDotProdMulti_Serial(nvec::Cint, x::N_Vector, Y, dotprods)
    ccall((:N_VDotProdMulti_Serial, libsundials_nvecserial), Cint, (Cint, N_Vector, Ptr{N_Vector}, Ptr{realtype}), nvec, x, Y, dotprods)
end

function N_VDotProdMulti_Serial(nvec, x, Y, dotprods)
    __x = convert(NVector, x)
    N_VDotProdMulti_Serial(convert(Cint, nvec), convert(N_Vector, __x), Y, dotprods)
end

function N_VLinearSumVectorArray_Serial(nvec::Cint, a::realtype, X, b::realtype, Y, Z)
    ccall((:N_VLinearSumVectorArray_Serial, libsundials_nvecserial), Cint, (Cint, realtype, Ptr{N_Vector}, realtype, Ptr{N_Vector}, Ptr{N_Vector}), nvec, a, X, b, Y, Z)
end

function N_VLinearSumVectorArray_Serial(nvec, a, X, b, Y, Z)
    N_VLinearSumVectorArray_Serial(convert(Cint, nvec), a, X, b, Y, Z)
end

function N_VScaleVectorArray_Serial(nvec::Cint, c, X, Z)
    ccall((:N_VScaleVectorArray_Serial, libsundials_nvecserial), Cint, (Cint, Ptr{realtype}, Ptr{N_Vector}, Ptr{N_Vector}), nvec, c, X, Z)
end

function N_VScaleVectorArray_Serial(nvec, c, X, Z)
    N_VScaleVectorArray_Serial(convert(Cint, nvec), c, X, Z)
end

function N_VConstVectorArray_Serial(nvecs::Cint, c::realtype, Z)
    ccall((:N_VConstVectorArray_Serial, libsundials_nvecserial), Cint, (Cint, realtype, Ptr{N_Vector}), nvecs, c, Z)
end

function N_VConstVectorArray_Serial(nvecs, c, Z)
    N_VConstVectorArray_Serial(convert(Cint, nvecs), c, Z)
end

function N_VWrmsNormVectorArray_Serial(nvecs::Cint, X, W, nrm)
    ccall((:N_VWrmsNormVectorArray_Serial, libsundials_nvecserial), Cint, (Cint, Ptr{N_Vector}, Ptr{N_Vector}, Ptr{realtype}), nvecs, X, W, nrm)
end

function N_VWrmsNormVectorArray_Serial(nvecs, X, W, nrm)
    N_VWrmsNormVectorArray_Serial(convert(Cint, nvecs), X, W, nrm)
end

function N_VWrmsNormMaskVectorArray_Serial(nvecs::Cint, X, W, id::N_Vector, nrm)
    ccall((:N_VWrmsNormMaskVectorArray_Serial, libsundials_nvecserial), Cint, (Cint, Ptr{N_Vector}, Ptr{N_Vector}, N_Vector, Ptr{realtype}), nvecs, X, W, id, nrm)
end

function N_VWrmsNormMaskVectorArray_Serial(nvecs, X, W, id, nrm)
    __id = convert(NVector, id)
    N_VWrmsNormMaskVectorArray_Serial(convert(Cint, nvecs), X, W, convert(N_Vector, __id), nrm)
end

function N_VScaleAddMultiVectorArray_Serial(nvec::Cint, nsum::Cint, a, X, Y, Z)
    ccall((:N_VScaleAddMultiVectorArray_Serial, libsundials_nvecserial), Cint, (Cint, Cint, Ptr{realtype}, Ptr{N_Vector}, Ptr{Ptr{N_Vector}}, Ptr{Ptr{N_Vector}}), nvec, nsum, a, X, Y, Z)
end

function N_VScaleAddMultiVectorArray_Serial(nvec, nsum, a, X, Y, Z)
    N_VScaleAddMultiVectorArray_Serial(convert(Cint, nvec), convert(Cint, nsum), a, X, Y, Z)
end

function N_VLinearCombinationVectorArray_Serial(nvec::Cint, nsum::Cint, c, X, Z)
    ccall((:N_VLinearCombinationVectorArray_Serial, libsundials_nvecserial), Cint, (Cint, Cint, Ptr{realtype}, Ptr{Ptr{N_Vector}}, Ptr{N_Vector}), nvec, nsum, c, X, Z)
end

function N_VLinearCombinationVectorArray_Serial(nvec, nsum, c, X, Z)
    N_VLinearCombinationVectorArray_Serial(convert(Cint, nvec), convert(Cint, nsum), c, X, Z)
end

function N_VWSqrSumLocal_Serial(x::N_Vector, w::N_Vector)
    ccall((:N_VWSqrSumLocal_Serial, libsundials_nvecserial), realtype, (N_Vector, N_Vector), x, w)
end

function N_VWSqrSumLocal_Serial(x, w)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    N_VWSqrSumLocal_Serial(convert(N_Vector, __x), convert(N_Vector, __w))
end

function N_VWSqrSumMaskLocal_Serial(x::N_Vector, w::N_Vector, id::N_Vector)
    ccall((:N_VWSqrSumMaskLocal_Serial, libsundials_nvecserial), realtype, (N_Vector, N_Vector, N_Vector), x, w, id)
end

function N_VWSqrSumMaskLocal_Serial(x, w, id)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    __id = convert(NVector, id)
    N_VWSqrSumMaskLocal_Serial(convert(N_Vector, __x), convert(N_Vector, __w), convert(N_Vector, __id))
end

function N_VEnableFusedOps_Serial(v::N_Vector, tf::Cint)
    ccall((:N_VEnableFusedOps_Serial, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableFusedOps_Serial(v, tf)
    __v = convert(NVector, v)
    N_VEnableFusedOps_Serial(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableLinearCombination_Serial(v::N_Vector, tf::Cint)
    ccall((:N_VEnableLinearCombination_Serial, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableLinearCombination_Serial(v, tf)
    __v = convert(NVector, v)
    N_VEnableLinearCombination_Serial(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableScaleAddMulti_Serial(v::N_Vector, tf::Cint)
    ccall((:N_VEnableScaleAddMulti_Serial, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableScaleAddMulti_Serial(v, tf)
    __v = convert(NVector, v)
    N_VEnableScaleAddMulti_Serial(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableDotProdMulti_Serial(v::N_Vector, tf::Cint)
    ccall((:N_VEnableDotProdMulti_Serial, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableDotProdMulti_Serial(v, tf)
    __v = convert(NVector, v)
    N_VEnableDotProdMulti_Serial(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableLinearSumVectorArray_Serial(v::N_Vector, tf::Cint)
    ccall((:N_VEnableLinearSumVectorArray_Serial, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableLinearSumVectorArray_Serial(v, tf)
    __v = convert(NVector, v)
    N_VEnableLinearSumVectorArray_Serial(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableScaleVectorArray_Serial(v::N_Vector, tf::Cint)
    ccall((:N_VEnableScaleVectorArray_Serial, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableScaleVectorArray_Serial(v, tf)
    __v = convert(NVector, v)
    N_VEnableScaleVectorArray_Serial(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableConstVectorArray_Serial(v::N_Vector, tf::Cint)
    ccall((:N_VEnableConstVectorArray_Serial, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableConstVectorArray_Serial(v, tf)
    __v = convert(NVector, v)
    N_VEnableConstVectorArray_Serial(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableWrmsNormVectorArray_Serial(v::N_Vector, tf::Cint)
    ccall((:N_VEnableWrmsNormVectorArray_Serial, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableWrmsNormVectorArray_Serial(v, tf)
    __v = convert(NVector, v)
    N_VEnableWrmsNormVectorArray_Serial(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableWrmsNormMaskVectorArray_Serial(v::N_Vector, tf::Cint)
    ccall((:N_VEnableWrmsNormMaskVectorArray_Serial, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableWrmsNormMaskVectorArray_Serial(v, tf)
    __v = convert(NVector, v)
    N_VEnableWrmsNormMaskVectorArray_Serial(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableScaleAddMultiVectorArray_Serial(v::N_Vector, tf::Cint)
    ccall((:N_VEnableScaleAddMultiVectorArray_Serial, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableScaleAddMultiVectorArray_Serial(v, tf)
    __v = convert(NVector, v)
    N_VEnableScaleAddMultiVectorArray_Serial(convert(N_Vector, __v), convert(Cint, tf))
end

function N_VEnableLinearCombinationVectorArray_Serial(v::N_Vector, tf::Cint)
    ccall((:N_VEnableLinearCombinationVectorArray_Serial, libsundials_nvecserial), Cint, (N_Vector, Cint), v, tf)
end

function N_VEnableLinearCombinationVectorArray_Serial(v, tf)
    __v = convert(NVector, v)
    N_VEnableLinearCombinationVectorArray_Serial(convert(N_Vector, __v), convert(Cint, tf))
end

function BandGBTRF(A::DlsMat, p)
    ccall((:BandGBTRF, libsundials_sundials), sunindextype, (DlsMat, Ptr{sunindextype}), A, p)
end

function bandGBTRF(a, n::sunindextype, mu::sunindextype, ml::sunindextype, smu::sunindextype, p)
    ccall((:bandGBTRF, libsundials_sundials), sunindextype, (Ptr{Ptr{realtype}}, sunindextype, sunindextype, sunindextype, sunindextype, Ptr{sunindextype}), a, n, mu, ml, smu, p)
end

function BandGBTRS(A::DlsMat, p, b)
    ccall((:BandGBTRS, libsundials_sundials), Cvoid, (DlsMat, Ptr{sunindextype}, Ptr{realtype}), A, p, b)
end

function bandGBTRS(a, n::sunindextype, smu::sunindextype, ml::sunindextype, p, b)
    ccall((:bandGBTRS, libsundials_sundials), Cvoid, (Ptr{Ptr{realtype}}, sunindextype, sunindextype, sunindextype, Ptr{sunindextype}, Ptr{realtype}), a, n, smu, ml, p, b)
end

function BandCopy(A::DlsMat, B::DlsMat, copymu::sunindextype, copyml::sunindextype)
    ccall((:BandCopy, libsundials_sundials), Cvoid, (DlsMat, DlsMat, sunindextype, sunindextype), A, B, copymu, copyml)
end

function bandCopy(a, b, n::sunindextype, a_smu::sunindextype, b_smu::sunindextype, copymu::sunindextype, copyml::sunindextype)
    ccall((:bandCopy, libsundials_sundials), Cvoid, (Ptr{Ptr{realtype}}, Ptr{Ptr{realtype}}, sunindextype, sunindextype, sunindextype, sunindextype, sunindextype), a, b, n, a_smu, b_smu, copymu, copyml)
end

function BandScale(c::realtype, A::DlsMat)
    ccall((:BandScale, libsundials_sundials), Cvoid, (realtype, DlsMat), c, A)
end

function bandScale(c::realtype, a, n::sunindextype, mu::sunindextype, ml::sunindextype, smu::sunindextype)
    ccall((:bandScale, libsundials_sundials), Cvoid, (realtype, Ptr{Ptr{realtype}}, sunindextype, sunindextype, sunindextype, sunindextype), c, a, n, mu, ml, smu)
end

function bandAddIdentity(a, n::sunindextype, smu::sunindextype)
    ccall((:bandAddIdentity, libsundials_sundials), Cvoid, (Ptr{Ptr{realtype}}, sunindextype, sunindextype), a, n, smu)
end

function BandMatvec(A::DlsMat, x, y)
    ccall((:BandMatvec, libsundials_sundials), Cvoid, (DlsMat, Ptr{realtype}, Ptr{realtype}), A, x, y)
end

function bandMatvec(a, x, y, n::sunindextype, mu::sunindextype, ml::sunindextype, smu::sunindextype)
    ccall((:bandMatvec, libsundials_sundials), Cvoid, (Ptr{Ptr{realtype}}, Ptr{realtype}, Ptr{realtype}, sunindextype, sunindextype, sunindextype, sunindextype), a, x, y, n, mu, ml, smu)
end

function DenseGETRF(A::DlsMat, p)
    ccall((:DenseGETRF, libsundials_sundials), sunindextype, (DlsMat, Ptr{sunindextype}), A, p)
end

function DenseGETRS(A::DlsMat, p, b)
    ccall((:DenseGETRS, libsundials_sundials), Cvoid, (DlsMat, Ptr{sunindextype}, Ptr{realtype}), A, p, b)
end

function denseGETRF(a, m::sunindextype, n::sunindextype, p)
    ccall((:denseGETRF, libsundials_sundials), sunindextype, (Ptr{Ptr{realtype}}, sunindextype, sunindextype, Ptr{sunindextype}), a, m, n, p)
end

function denseGETRS(a, n::sunindextype, p, b)
    ccall((:denseGETRS, libsundials_sundials), Cvoid, (Ptr{Ptr{realtype}}, sunindextype, Ptr{sunindextype}, Ptr{realtype}), a, n, p, b)
end

function DensePOTRF(A::DlsMat)
    ccall((:DensePOTRF, libsundials_sundials), sunindextype, (DlsMat,), A)
end

function DensePOTRS(A::DlsMat, b)
    ccall((:DensePOTRS, libsundials_sundials), Cvoid, (DlsMat, Ptr{realtype}), A, b)
end

function densePOTRF(a, m::sunindextype)
    ccall((:densePOTRF, libsundials_sundials), sunindextype, (Ptr{Ptr{realtype}}, sunindextype), a, m)
end

function densePOTRS(a, m::sunindextype, b)
    ccall((:densePOTRS, libsundials_sundials), Cvoid, (Ptr{Ptr{realtype}}, sunindextype, Ptr{realtype}), a, m, b)
end

function DenseGEQRF(A::DlsMat, beta, wrk)
    ccall((:DenseGEQRF, libsundials_sundials), Cint, (DlsMat, Ptr{realtype}, Ptr{realtype}), A, beta, wrk)
end

function DenseORMQR(A::DlsMat, beta, vn, vm, wrk)
    ccall((:DenseORMQR, libsundials_sundials), Cint, (DlsMat, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}), A, beta, vn, vm, wrk)
end

function denseGEQRF(a, m::sunindextype, n::sunindextype, beta, wrk)
    ccall((:denseGEQRF, libsundials_sundials), Cint, (Ptr{Ptr{realtype}}, sunindextype, sunindextype, Ptr{realtype}, Ptr{realtype}), a, m, n, beta, wrk)
end

function denseORMQR(a, m::sunindextype, n::sunindextype, beta, v, w, wrk)
    ccall((:denseORMQR, libsundials_sundials), Cint, (Ptr{Ptr{realtype}}, sunindextype, sunindextype, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}, Ptr{realtype}), a, m, n, beta, v, w, wrk)
end

function DenseCopy(A::DlsMat, B::DlsMat)
    ccall((:DenseCopy, libsundials_sundials), Cvoid, (DlsMat, DlsMat), A, B)
end

function denseCopy(a, b, m::sunindextype, n::sunindextype)
    ccall((:denseCopy, libsundials_sundials), Cvoid, (Ptr{Ptr{realtype}}, Ptr{Ptr{realtype}}, sunindextype, sunindextype), a, b, m, n)
end

function DenseScale(c::realtype, A::DlsMat)
    ccall((:DenseScale, libsundials_sundials), Cvoid, (realtype, DlsMat), c, A)
end

function denseScale(c::realtype, a, m::sunindextype, n::sunindextype)
    ccall((:denseScale, libsundials_sundials), Cvoid, (realtype, Ptr{Ptr{realtype}}, sunindextype, sunindextype), c, a, m, n)
end

function denseAddIdentity(a, n::sunindextype)
    ccall((:denseAddIdentity, libsundials_sundials), Cvoid, (Ptr{Ptr{realtype}}, sunindextype), a, n)
end

function DenseMatvec(A::DlsMat, x, y)
    ccall((:DenseMatvec, libsundials_sundials), Cvoid, (DlsMat, Ptr{realtype}, Ptr{realtype}), A, x, y)
end

function denseMatvec(a, x, y, m::sunindextype, n::sunindextype)
    ccall((:denseMatvec, libsundials_sundials), Cvoid, (Ptr{Ptr{realtype}}, Ptr{realtype}, Ptr{realtype}, sunindextype, sunindextype), a, x, y, m, n)
end

function NewDenseMat(M::sunindextype, N::sunindextype)
    ccall((:NewDenseMat, libsundials_sundials), DlsMat, (sunindextype, sunindextype), M, N)
end

function NewBandMat(N::sunindextype, mu::sunindextype, ml::sunindextype, smu::sunindextype)
    ccall((:NewBandMat, libsundials_sundials), DlsMat, (sunindextype, sunindextype, sunindextype, sunindextype), N, mu, ml, smu)
end

function DestroyMat(A::DlsMat)
    ccall((:DestroyMat, libsundials_sundials), Cvoid, (DlsMat,), A)
end

function NewIntArray(N::Cint)
    ccall((:NewIntArray, libsundials_sundials), Ptr{Cint}, (Cint,), N)
end

function NewIndexArray(N::sunindextype)
    ccall((:NewIndexArray, libsundials_sundials), Ptr{sunindextype}, (sunindextype,), N)
end

function NewRealArray(N::sunindextype)
    ccall((:NewRealArray, libsundials_sundials), Ptr{realtype}, (sunindextype,), N)
end

function DestroyArray(p)
    ccall((:DestroyArray, libsundials_sundials), Cvoid, (Ptr{Cvoid},), p)
end

function AddIdentity(A::DlsMat)
    ccall((:AddIdentity, libsundials_sundials), Cvoid, (DlsMat,), A)
end

function SetToZero(A::DlsMat)
    ccall((:SetToZero, libsundials_sundials), Cvoid, (DlsMat,), A)
end

function PrintMat(A::DlsMat, outfile)
    ccall((:PrintMat, libsundials_sundials), Cvoid, (DlsMat, Ptr{Libc.FILE}), A, outfile)
end

function newDenseMat(m::sunindextype, n::sunindextype)
    ccall((:newDenseMat, libsundials_sundials), Ptr{Ptr{realtype}}, (sunindextype, sunindextype), m, n)
end

function newBandMat(n::sunindextype, smu::sunindextype, ml::sunindextype)
    ccall((:newBandMat, libsundials_sundials), Ptr{Ptr{realtype}}, (sunindextype, sunindextype, sunindextype), n, smu, ml)
end

function destroyMat(a)
    ccall((:destroyMat, libsundials_sundials), Cvoid, (Ptr{Ptr{realtype}},), a)
end

function newIntArray(n::Cint)
    ccall((:newIntArray, libsundials_sundials), Ptr{Cint}, (Cint,), n)
end

function newIndexArray(n::sunindextype)
    ccall((:newIndexArray, libsundials_sundials), Ptr{sunindextype}, (sunindextype,), n)
end

function newRealArray(m::sunindextype)
    ccall((:newRealArray, libsundials_sundials), Ptr{realtype}, (sunindextype,), m)
end

function destroyArray(v)
    ccall((:destroyArray, libsundials_sundials), Cvoid, (Ptr{Cvoid},), v)
end

function SUNDIALSFileOpen(filename, modes)
    ccall((:SUNDIALSFileOpen, libsundials_sundials), Ptr{Libc.FILE}, (Cstring, Cstring), filename, modes)
end

function SUNDIALSFileClose(fp)
    ccall((:SUNDIALSFileClose, libsundials_sundials), Cvoid, (Ptr{Libc.FILE},), fp)
end

function ModifiedGS(v, h, k::Cint, p::Cint, new_vk_norm)
    ccall((:ModifiedGS, libsundials_sundials), Cint, (Ptr{N_Vector}, Ptr{Ptr{realtype}}, Cint, Cint, Ptr{realtype}), v, h, k, p, new_vk_norm)
end

function ClassicalGS(v, h, k::Cint, p::Cint, new_vk_norm, stemp, vtemp)
    ccall((:ClassicalGS, libsundials_sundials), Cint, (Ptr{N_Vector}, Ptr{Ptr{realtype}}, Cint, Cint, Ptr{realtype}, Ptr{realtype}, Ptr{N_Vector}), v, h, k, p, new_vk_norm, stemp, vtemp)
end

function QRfact(n::Cint, h, q, job::Cint)
    ccall((:QRfact, libsundials_sundials), Cint, (Cint, Ptr{Ptr{realtype}}, Ptr{realtype}, Cint), n, h, q, job)
end

function QRsol(n::Cint, h, q, b)
    ccall((:QRsol, libsundials_sundials), Cint, (Cint, Ptr{Ptr{realtype}}, Ptr{realtype}, Ptr{realtype}), n, h, q, b)
end

function dcopy_64_(n, x, inc_x, y, inc_y)
    ccall((:dcopy_64_, libsundials_sundials), Cvoid, (Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}), n, x, inc_x, y, inc_y)
end

function dscal_64_(n, alpha, x, inc_x)
    ccall((:dscal_64_, libsundials_sundials), Cvoid, (Ptr{sunindextype}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{sunindextype}), n, alpha, x, inc_x)
end

function scopy_64_(n, x, inc_x, y, inc_y)
    ccall((:scopy_64_, libsundials_sundials), Cvoid, (Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}), n, x, inc_x, y, inc_y)
end

function sscal_64_(n, alpha, x, inc_x)
    ccall((:sscal_64_, libsundials_sundials), Cvoid, (Ptr{sunindextype}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{sunindextype}), n, alpha, x, inc_x)
end

function dgemv_64_(trans, m, n, alpha, a, lda, x, inc_x, beta, y, inc_y)
    ccall((:dgemv_64_, libsundials_sundials), Cvoid, (Cstring, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{sunindextype}), trans, m, n, alpha, a, lda, x, inc_x, beta, y, inc_y)
end

function dtrsv_64_(uplo, trans, diag, n, a, lda, x, inc_x)
    ccall((:dtrsv_64_, libsundials_sundials), Cvoid, (Cstring, Cstring, Cstring, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}), uplo, trans, diag, n, a, lda, x, inc_x)
end

function sgemv_64_(trans, m, n, alpha, a, lda, x, inc_x, beta, y, inc_y)
    ccall((:sgemv_64_, libsundials_sundials), Cvoid, (Cstring, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{sunindextype}), trans, m, n, alpha, a, lda, x, inc_x, beta, y, inc_y)
end

function strsv_64_(uplo, trans, diag, n, a, lda, x, inc_x)
    ccall((:strsv_64_, libsundials_sundials), Cvoid, (Cstring, Cstring, Cstring, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}), uplo, trans, diag, n, a, lda, x, inc_x)
end

function dsyrk_64_(uplo, trans, n, k, alpha, a, lda, beta, c, ldc)
    ccall((:dsyrk_64_, libsundials_sundials), Cvoid, (Cstring, Cstring, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{sunindextype}), uplo, trans, n, k, alpha, a, lda, beta, c, ldc)
end

function ssyrk_64_(uplo, trans, n, k, alpha, a, lda, beta, c, ldc)
    ccall((:ssyrk_64_, libsundials_sundials), Cvoid, (Cstring, Cstring, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{sunindextype}), uplo, trans, n, k, alpha, a, lda, beta, c, ldc)
end

function dgbtrf_64_(m, n, kl, ku, ab, ldab, ipiv, info)
    ccall((:dgbtrf_64_, libsundials_sundials), Cvoid, (Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}), m, n, kl, ku, ab, ldab, ipiv, info)
end

function dgbtrs_64_(trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info)
    ccall((:dgbtrs_64_, libsundials_sundials), Cvoid, (Cstring, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{sunindextype}), trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info)
end

function dgeqp3_64_(m, n, a, lda, jpvt, tau, work, lwork, info)
    ccall((:dgeqp3_64_, libsundials_sundials), Cvoid, (Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{sunindextype}), m, n, a, lda, jpvt, tau, work, lwork, info)
end

function dgeqrf_64_(m, n, a, lda, tau, work, lwork, info)
    ccall((:dgeqrf_64_, libsundials_sundials), Cvoid, (Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{sunindextype}), m, n, a, lda, tau, work, lwork, info)
end

function dgetrf_64_(m, n, a, lda, ipiv, info)
    ccall((:dgetrf_64_, libsundials_sundials), Cvoid, (Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}), m, n, a, lda, ipiv, info)
end

function dgetrs_64_(trans, n, nrhs, a, lda, ipiv, b, ldb, info)
    ccall((:dgetrs_64_, libsundials_sundials), Cvoid, (Cstring, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{sunindextype}), trans, n, nrhs, a, lda, ipiv, b, ldb, info)
end

function dormqr_64_(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)
    ccall((:dormqr_64_, libsundials_sundials), Cvoid, (Cstring, Cstring, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{sunindextype}), side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)
end

function dpotrf_64_(uplo, n, a, lda, info)
    ccall((:dpotrf_64_, libsundials_sundials), Cvoid, (Cstring, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{sunindextype}), uplo, n, a, lda, info)
end

function dpotrs_64_(uplo, n, nrhs, a, lda, b, ldb, info)
    ccall((:dpotrs_64_, libsundials_sundials), Cvoid, (Cstring, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{Cdouble}, Ptr{sunindextype}, Ptr{sunindextype}), uplo, n, nrhs, a, lda, b, ldb, info)
end

function sgbtrf_64_(m, n, kl, ku, ab, ldab, ipiv, info)
    ccall((:sgbtrf_64_, libsundials_sundials), Cvoid, (Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}), m, n, kl, ku, ab, ldab, ipiv, info)
end

function sgbtrs_64_(trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info)
    ccall((:sgbtrs_64_, libsundials_sundials), Cvoid, (Cstring, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{sunindextype}), trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info)
end

function sgeqp3_64_(m, n, a, lda, jpvt, tau, work, lwork, info)
    ccall((:sgeqp3_64_, libsundials_sundials), Cvoid, (Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{sunindextype}), m, n, a, lda, jpvt, tau, work, lwork, info)
end

function sgeqrf_64_(m, n, a, lda, tau, work, lwork, info)
    ccall((:sgeqrf_64_, libsundials_sundials), Cvoid, (Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{sunindextype}), m, n, a, lda, tau, work, lwork, info)
end

function sgetrf_64_(m, n, a, lda, ipiv, info)
    ccall((:sgetrf_64_, libsundials_sundials), Cvoid, (Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}), m, n, a, lda, ipiv, info)
end

function sgetrs_64_(trans, n, nrhs, a, lda, ipiv, b, ldb, info)
    ccall((:sgetrs_64_, libsundials_sundials), Cvoid, (Cstring, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{sunindextype}), trans, n, nrhs, a, lda, ipiv, b, ldb, info)
end

function sormqr_64_(side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)
    ccall((:sormqr_64_, libsundials_sundials), Cvoid, (Cstring, Cstring, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{sunindextype}), side, trans, m, n, k, a, lda, tau, c, ldc, work, lwork, info)
end

function spotrf_64_(uplo, n, a, lda, info)
    ccall((:spotrf_64_, libsundials_sundials), Cvoid, (Cstring, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{sunindextype}), uplo, n, a, lda, info)
end

function spotrs_64_(uplo, n, nrhs, a, lda, b, ldb, info)
    ccall((:spotrs_64_, libsundials_sundials), Cvoid, (Cstring, Ptr{sunindextype}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{Cfloat}, Ptr{sunindextype}, Ptr{sunindextype}), uplo, n, nrhs, a, lda, b, ldb, info)
end

# no prototype is found for this function at sundials_linearsolver.h:137:33, please use with caution
function SUNLinSolNewEmpty()
    ccall((:SUNLinSolNewEmpty, libsundials_sundials), SUNLinearSolver, ())
end

function SUNLinSolFreeEmpty(S::SUNLinearSolver)
    ccall((:SUNLinSolFreeEmpty, libsundials_sundials), Cvoid, (SUNLinearSolver,), S)
end

function SUNLinSolGetType(S::SUNLinearSolver)
    ccall((:SUNLinSolGetType, libsundials_sundials), SUNLinearSolver_Type, (SUNLinearSolver,), S)
end

function SUNLinSolGetID(S::SUNLinearSolver)
    ccall((:SUNLinSolGetID, libsundials_sundials), SUNLinearSolver_ID, (SUNLinearSolver,), S)
end

function SUNLinSolSetATimes(S::SUNLinearSolver, A_data, ATimes::ATimesFn)
    ccall((:SUNLinSolSetATimes, libsundials_sundials), Cint, (SUNLinearSolver, Ptr{Cvoid}, ATimesFn), S, A_data, ATimes)
end

function SUNLinSolSetPreconditioner(S::SUNLinearSolver, P_data, Pset::PSetupFn, Psol::PSolveFn)
    ccall((:SUNLinSolSetPreconditioner, libsundials_sundials), Cint, (SUNLinearSolver, Ptr{Cvoid}, PSetupFn, PSolveFn), S, P_data, Pset, Psol)
end

function SUNLinSolSetScalingVectors(S::SUNLinearSolver, s1::N_Vector, s2::N_Vector)
    ccall((:SUNLinSolSetScalingVectors, libsundials_sundials), Cint, (SUNLinearSolver, N_Vector, N_Vector), S, s1, s2)
end

function SUNLinSolSetScalingVectors(S, s1, s2)
    __s1 = convert(NVector, s1)
    __s2 = convert(NVector, s2)
    SUNLinSolSetScalingVectors(S, convert(N_Vector, __s1), convert(N_Vector, __s2))
end

function SUNLinSolInitialize(S::SUNLinearSolver)
    ccall((:SUNLinSolInitialize, libsundials_sundials), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolSetup(S::SUNLinearSolver, A::SUNMatrix)
    ccall((:SUNLinSolSetup, libsundials_sundials), Cint, (SUNLinearSolver, SUNMatrix), S, A)
end

function SUNLinSolSolve(S::SUNLinearSolver, A::SUNMatrix, x::N_Vector, b::N_Vector, tol::realtype)
    ccall((:SUNLinSolSolve, libsundials_sundials), Cint, (SUNLinearSolver, SUNMatrix, N_Vector, N_Vector, realtype), S, A, x, b, tol)
end

function SUNLinSolSolve(S, A, x, b, tol)
    __x = convert(NVector, x)
    __b = convert(NVector, b)
    SUNLinSolSolve(S, A, convert(N_Vector, __x), convert(N_Vector, __b), tol)
end

function SUNLinSolNumIters(S::SUNLinearSolver)
    ccall((:SUNLinSolNumIters, libsundials_sundials), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolResNorm(S::SUNLinearSolver)
    ccall((:SUNLinSolResNorm, libsundials_sundials), realtype, (SUNLinearSolver,), S)
end

function SUNLinSolResid(S::SUNLinearSolver)
    ccall((:SUNLinSolResid, libsundials_sundials), N_Vector, (SUNLinearSolver,), S)
end

function SUNLinSolLastFlag(S::SUNLinearSolver)
    ccall((:SUNLinSolLastFlag, libsundials_sundials), sunindextype, (SUNLinearSolver,), S)
end

function SUNLinSolSpace(S::SUNLinearSolver, lenrwLS, leniwLS)
    ccall((:SUNLinSolSpace, libsundials_sundials), Cint, (SUNLinearSolver, Ptr{Clong}, Ptr{Clong}), S, lenrwLS, leniwLS)
end

function SUNLinSolFree(S::SUNLinearSolver)
    ccall((:SUNLinSolFree, libsundials_sundials), Cint, (SUNLinearSolver,), S)
end

function SUNRpowerI(base::realtype, exponent::Cint)
    ccall((:SUNRpowerI, libsundials_sundials), realtype, (realtype, Cint), base, exponent)
end

function SUNRpowerI(base, exponent)
    SUNRpowerI(base, convert(Cint, exponent))
end

function SUNRpowerR(base::realtype, exponent::realtype)
    ccall((:SUNRpowerR, libsundials_sundials), realtype, (realtype, realtype), base, exponent)
end

# no prototype is found for this function at sundials_matrix.h:106:27, please use with caution
function SUNMatNewEmpty()
    ccall((:SUNMatNewEmpty, libsundials_sundials), SUNMatrix, ())
end

function SUNMatFreeEmpty(A::SUNMatrix)
    ccall((:SUNMatFreeEmpty, libsundials_sundials), Cvoid, (SUNMatrix,), A)
end

function SUNMatCopyOps(A::SUNMatrix, B::SUNMatrix)
    ccall((:SUNMatCopyOps, libsundials_sundials), Cint, (SUNMatrix, SUNMatrix), A, B)
end

function SUNMatGetID(A::SUNMatrix)
    ccall((:SUNMatGetID, libsundials_sundials), SUNMatrix_ID, (SUNMatrix,), A)
end

function SUNMatClone(A::SUNMatrix)
    ccall((:SUNMatClone, libsundials_sundials), SUNMatrix, (SUNMatrix,), A)
end

function SUNMatDestroy(A::SUNMatrix)
    ccall((:SUNMatDestroy, libsundials_sundials), Cvoid, (SUNMatrix,), A)
end

function SUNMatZero(A::SUNMatrix)
    ccall((:SUNMatZero, libsundials_sundials), Cint, (SUNMatrix,), A)
end

function SUNMatCopy(A::SUNMatrix, B::SUNMatrix)
    ccall((:SUNMatCopy, libsundials_sundials), Cint, (SUNMatrix, SUNMatrix), A, B)
end

function SUNMatScaleAdd(c::realtype, A::SUNMatrix, B::SUNMatrix)
    ccall((:SUNMatScaleAdd, libsundials_sundials), Cint, (realtype, SUNMatrix, SUNMatrix), c, A, B)
end

function SUNMatScaleAddI(c::realtype, A::SUNMatrix)
    ccall((:SUNMatScaleAddI, libsundials_sundials), Cint, (realtype, SUNMatrix), c, A)
end

function SUNMatMatvecSetup(A::SUNMatrix)
    ccall((:SUNMatMatvecSetup, libsundials_sundials), Cint, (SUNMatrix,), A)
end

function SUNMatMatvec(A::SUNMatrix, x::N_Vector, y::N_Vector)
    ccall((:SUNMatMatvec, libsundials_sundials), Cint, (SUNMatrix, N_Vector, N_Vector), A, x, y)
end

function SUNMatMatvec(A, x, y)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    SUNMatMatvec(A, convert(N_Vector, __x), convert(N_Vector, __y))
end

function SUNMatSpace(A::SUNMatrix, lenrw, leniw)
    ccall((:SUNMatSpace, libsundials_sundials), Cint, (SUNMatrix, Ptr{Clong}, Ptr{Clong}), A, lenrw, leniw)
end

# no prototype is found for this function at sundials_nonlinearsolver.h:131:36, please use with caution
function SUNNonlinSolNewEmpty()
    ccall((:SUNNonlinSolNewEmpty, libsundials_sundials), SUNNonlinearSolver, ())
end

function SUNNonlinSolFreeEmpty(NLS::SUNNonlinearSolver)
    ccall((:SUNNonlinSolFreeEmpty, libsundials_sundials), Cvoid, (SUNNonlinearSolver,), NLS)
end

function SUNNonlinSolGetType(NLS::SUNNonlinearSolver)
    ccall((:SUNNonlinSolGetType, libsundials_sundials), SUNNonlinearSolver_Type, (SUNNonlinearSolver,), NLS)
end

function SUNNonlinSolInitialize(NLS::SUNNonlinearSolver)
    ccall((:SUNNonlinSolInitialize, libsundials_sundials), Cint, (SUNNonlinearSolver,), NLS)
end

function SUNNonlinSolSetup(NLS::SUNNonlinearSolver, y::N_Vector, mem)
    ccall((:SUNNonlinSolSetup, libsundials_sundials), Cint, (SUNNonlinearSolver, N_Vector, Ptr{Cvoid}), NLS, y, mem)
end

function SUNNonlinSolSetup(NLS, y, mem)
    __y = convert(NVector, y)
    SUNNonlinSolSetup(NLS, convert(N_Vector, __y), mem)
end

function SUNNonlinSolSolve(NLS::SUNNonlinearSolver, y0::N_Vector, y::N_Vector, w::N_Vector, tol::realtype, callLSetup::Cint, mem)
    ccall((:SUNNonlinSolSolve, libsundials_sundials), Cint, (SUNNonlinearSolver, N_Vector, N_Vector, N_Vector, realtype, Cint, Ptr{Cvoid}), NLS, y0, y, w, tol, callLSetup, mem)
end

function SUNNonlinSolSolve(NLS, y0, y, w, tol, callLSetup, mem)
    __y0 = convert(NVector, y0)
    __y = convert(NVector, y)
    __w = convert(NVector, w)
    SUNNonlinSolSolve(NLS, convert(N_Vector, __y0), convert(N_Vector, __y), convert(N_Vector, __w), tol, convert(Cint, callLSetup), mem)
end

function SUNNonlinSolFree(NLS::SUNNonlinearSolver)
    ccall((:SUNNonlinSolFree, libsundials_sundials), Cint, (SUNNonlinearSolver,), NLS)
end

function SUNNonlinSolSetSysFn(NLS::SUNNonlinearSolver, SysFn::SUNNonlinSolSysFn)
    ccall((:SUNNonlinSolSetSysFn, libsundials_sundials), Cint, (SUNNonlinearSolver, SUNNonlinSolSysFn), NLS, SysFn)
end

function SUNNonlinSolSetLSetupFn(NLS::SUNNonlinearSolver, SetupFn::SUNNonlinSolLSetupFn)
    ccall((:SUNNonlinSolSetLSetupFn, libsundials_sundials), Cint, (SUNNonlinearSolver, SUNNonlinSolLSetupFn), NLS, SetupFn)
end

function SUNNonlinSolSetLSolveFn(NLS::SUNNonlinearSolver, SolveFn::SUNNonlinSolLSolveFn)
    ccall((:SUNNonlinSolSetLSolveFn, libsundials_sundials), Cint, (SUNNonlinearSolver, SUNNonlinSolLSolveFn), NLS, SolveFn)
end

function SUNNonlinSolSetConvTestFn(NLS::SUNNonlinearSolver, CTestFn::SUNNonlinSolConvTestFn, ctest_data)
    ccall((:SUNNonlinSolSetConvTestFn, libsundials_sundials), Cint, (SUNNonlinearSolver, SUNNonlinSolConvTestFn, Ptr{Cvoid}), NLS, CTestFn, ctest_data)
end

function SUNNonlinSolSetMaxIters(NLS::SUNNonlinearSolver, maxiters::Cint)
    ccall((:SUNNonlinSolSetMaxIters, libsundials_sundials), Cint, (SUNNonlinearSolver, Cint), NLS, maxiters)
end

function SUNNonlinSolSetMaxIters(NLS, maxiters)
    SUNNonlinSolSetMaxIters(NLS, convert(Cint, maxiters))
end

function SUNNonlinSolGetNumIters(NLS::SUNNonlinearSolver, niters)
    ccall((:SUNNonlinSolGetNumIters, libsundials_sundials), Cint, (SUNNonlinearSolver, Ptr{Clong}), NLS, niters)
end

function SUNNonlinSolGetCurIter(NLS::SUNNonlinearSolver, iter)
    ccall((:SUNNonlinSolGetCurIter, libsundials_sundials), Cint, (SUNNonlinearSolver, Ptr{Cint}), NLS, iter)
end

function SUNNonlinSolGetNumConvFails(NLS::SUNNonlinearSolver, nconvfails)
    ccall((:SUNNonlinSolGetNumConvFails, libsundials_sundials), Cint, (SUNNonlinearSolver, Ptr{Clong}), NLS, nconvfails)
end

# no prototype is found for this function at sundials_nvector.h:163:26, please use with caution
function N_VNewEmpty()
    ccall((:N_VNewEmpty, libsundials_sundials), N_Vector, ())
end

function N_VFreeEmpty(v::N_Vector)
    ccall((:N_VFreeEmpty, libsundials_sundials), Cvoid, (N_Vector,), v)
end

function N_VFreeEmpty(v)
    __v = convert(NVector, v)
    N_VFreeEmpty(convert(N_Vector, __v))
end

function N_VCopyOps(w::N_Vector, v::N_Vector)
    ccall((:N_VCopyOps, libsundials_sundials), Cint, (N_Vector, N_Vector), w, v)
end

function N_VCopyOps(w, v)
    __w = convert(NVector, w)
    __v = convert(NVector, v)
    N_VCopyOps(convert(N_Vector, __w), convert(N_Vector, __v))
end

function N_VGetVectorID(w::N_Vector)
    ccall((:N_VGetVectorID, libsundials_sundials), N_Vector_ID, (N_Vector,), w)
end

function N_VGetVectorID(w)
    __w = convert(NVector, w)
    N_VGetVectorID(convert(N_Vector, __w))
end

function N_VClone(w::N_Vector)
    ccall((:N_VClone, libsundials_sundials), N_Vector, (N_Vector,), w)
end

function N_VClone(w)
    __w = convert(NVector, w)
    N_VClone(convert(N_Vector, __w))
end

function N_VCloneEmpty(w::N_Vector)
    ccall((:N_VCloneEmpty, libsundials_sundials), N_Vector, (N_Vector,), w)
end

function N_VCloneEmpty(w)
    __w = convert(NVector, w)
    N_VCloneEmpty(convert(N_Vector, __w))
end

function N_VDestroy(v::N_Vector)
    ccall((:N_VDestroy, libsundials_sundials), Cvoid, (N_Vector,), v)
end

function N_VDestroy(v)
    __v = convert(NVector, v)
    N_VDestroy(convert(N_Vector, __v))
end

function N_VSpace(v::N_Vector, lrw, liw)
    ccall((:N_VSpace, libsundials_sundials), Cvoid, (N_Vector, Ptr{sunindextype}, Ptr{sunindextype}), v, lrw, liw)
end

function N_VSpace(v, lrw, liw)
    __v = convert(NVector, v)
    N_VSpace(convert(N_Vector, __v), lrw, liw)
end

function N_VGetArrayPointer(v::N_Vector)
    ccall((:N_VGetArrayPointer, libsundials_sundials), Ptr{realtype}, (N_Vector,), v)
end

function N_VGetArrayPointer(v)
    __v = convert(NVector, v)
    N_VGetArrayPointer(convert(N_Vector, __v))
end

function N_VSetArrayPointer(v_data, v::N_Vector)
    ccall((:N_VSetArrayPointer, libsundials_sundials), Cvoid, (Ptr{realtype}, N_Vector), v_data, v)
end

function N_VSetArrayPointer(v_data, v)
    __v = convert(NVector, v)
    N_VSetArrayPointer(v_data, convert(N_Vector, __v))
end

function N_VGetCommunicator(v::N_Vector)
    ccall((:N_VGetCommunicator, libsundials_sundials), Ptr{Cvoid}, (N_Vector,), v)
end

function N_VGetCommunicator(v)
    __v = convert(NVector, v)
    N_VGetCommunicator(convert(N_Vector, __v))
end

function N_VGetLength(v::N_Vector)
    ccall((:N_VGetLength, libsundials_sundials), sunindextype, (N_Vector,), v)
end

function N_VGetLength(v)
    __v = convert(NVector, v)
    N_VGetLength(convert(N_Vector, __v))
end

function N_VLinearSum(a::realtype, x::N_Vector, b::realtype, y::N_Vector, z::N_Vector)
    ccall((:N_VLinearSum, libsundials_sundials), Cvoid, (realtype, N_Vector, realtype, N_Vector, N_Vector), a, x, b, y, z)
end

function N_VLinearSum(a, x, b, y, z)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    __z = convert(NVector, z)
    N_VLinearSum(a, convert(N_Vector, __x), b, convert(N_Vector, __y), convert(N_Vector, __z))
end

function N_VConst(c::realtype, z::N_Vector)
    ccall((:N_VConst, libsundials_sundials), Cvoid, (realtype, N_Vector), c, z)
end

function N_VConst(c, z)
    __z = convert(NVector, z)
    N_VConst(c, convert(N_Vector, __z))
end

function N_VProd(x::N_Vector, y::N_Vector, z::N_Vector)
    ccall((:N_VProd, libsundials_sundials), Cvoid, (N_Vector, N_Vector, N_Vector), x, y, z)
end

function N_VProd(x, y, z)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    __z = convert(NVector, z)
    N_VProd(convert(N_Vector, __x), convert(N_Vector, __y), convert(N_Vector, __z))
end

function N_VDiv(x::N_Vector, y::N_Vector, z::N_Vector)
    ccall((:N_VDiv, libsundials_sundials), Cvoid, (N_Vector, N_Vector, N_Vector), x, y, z)
end

function N_VDiv(x, y, z)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    __z = convert(NVector, z)
    N_VDiv(convert(N_Vector, __x), convert(N_Vector, __y), convert(N_Vector, __z))
end

function N_VScale(c::realtype, x::N_Vector, z::N_Vector)
    ccall((:N_VScale, libsundials_sundials), Cvoid, (realtype, N_Vector, N_Vector), c, x, z)
end

function N_VScale(c, x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VScale(c, convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VAbs(x::N_Vector, z::N_Vector)
    ccall((:N_VAbs, libsundials_sundials), Cvoid, (N_Vector, N_Vector), x, z)
end

function N_VAbs(x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VAbs(convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VInv(x::N_Vector, z::N_Vector)
    ccall((:N_VInv, libsundials_sundials), Cvoid, (N_Vector, N_Vector), x, z)
end

function N_VInv(x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VInv(convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VAddConst(x::N_Vector, b::realtype, z::N_Vector)
    ccall((:N_VAddConst, libsundials_sundials), Cvoid, (N_Vector, realtype, N_Vector), x, b, z)
end

function N_VAddConst(x, b, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VAddConst(convert(N_Vector, __x), b, convert(N_Vector, __z))
end

function N_VDotProd(x::N_Vector, y::N_Vector)
    ccall((:N_VDotProd, libsundials_sundials), realtype, (N_Vector, N_Vector), x, y)
end

function N_VDotProd(x, y)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    N_VDotProd(convert(N_Vector, __x), convert(N_Vector, __y))
end

function N_VMaxNorm(x::N_Vector)
    ccall((:N_VMaxNorm, libsundials_sundials), realtype, (N_Vector,), x)
end

function N_VMaxNorm(x)
    __x = convert(NVector, x)
    N_VMaxNorm(convert(N_Vector, __x))
end

function N_VWrmsNorm(x::N_Vector, w::N_Vector)
    ccall((:N_VWrmsNorm, libsundials_sundials), realtype, (N_Vector, N_Vector), x, w)
end

function N_VWrmsNorm(x, w)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    N_VWrmsNorm(convert(N_Vector, __x), convert(N_Vector, __w))
end

function N_VWrmsNormMask(x::N_Vector, w::N_Vector, id::N_Vector)
    ccall((:N_VWrmsNormMask, libsundials_sundials), realtype, (N_Vector, N_Vector, N_Vector), x, w, id)
end

function N_VWrmsNormMask(x, w, id)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    __id = convert(NVector, id)
    N_VWrmsNormMask(convert(N_Vector, __x), convert(N_Vector, __w), convert(N_Vector, __id))
end

function N_VMin(x::N_Vector)
    ccall((:N_VMin, libsundials_sundials), realtype, (N_Vector,), x)
end

function N_VMin(x)
    __x = convert(NVector, x)
    N_VMin(convert(N_Vector, __x))
end

function N_VWL2Norm(x::N_Vector, w::N_Vector)
    ccall((:N_VWL2Norm, libsundials_sundials), realtype, (N_Vector, N_Vector), x, w)
end

function N_VWL2Norm(x, w)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    N_VWL2Norm(convert(N_Vector, __x), convert(N_Vector, __w))
end

function N_VL1Norm(x::N_Vector)
    ccall((:N_VL1Norm, libsundials_sundials), realtype, (N_Vector,), x)
end

function N_VL1Norm(x)
    __x = convert(NVector, x)
    N_VL1Norm(convert(N_Vector, __x))
end

function N_VCompare(c::realtype, x::N_Vector, z::N_Vector)
    ccall((:N_VCompare, libsundials_sundials), Cvoid, (realtype, N_Vector, N_Vector), c, x, z)
end

function N_VCompare(c, x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VCompare(c, convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VInvTest(x::N_Vector, z::N_Vector)
    ccall((:N_VInvTest, libsundials_sundials), Cint, (N_Vector, N_Vector), x, z)
end

function N_VInvTest(x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VInvTest(convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VConstrMask(c::N_Vector, x::N_Vector, m::N_Vector)
    ccall((:N_VConstrMask, libsundials_sundials), Cint, (N_Vector, N_Vector, N_Vector), c, x, m)
end

function N_VConstrMask(c, x, m)
    __c = convert(NVector, c)
    __x = convert(NVector, x)
    __m = convert(NVector, m)
    N_VConstrMask(convert(N_Vector, __c), convert(N_Vector, __x), convert(N_Vector, __m))
end

function N_VMinQuotient(num::N_Vector, denom::N_Vector)
    ccall((:N_VMinQuotient, libsundials_sundials), realtype, (N_Vector, N_Vector), num, denom)
end

function N_VMinQuotient(num, denom)
    __num = convert(NVector, num)
    __denom = convert(NVector, denom)
    N_VMinQuotient(convert(N_Vector, __num), convert(N_Vector, __denom))
end

function N_VLinearCombination(nvec::Cint, c, X, z::N_Vector)
    ccall((:N_VLinearCombination, libsundials_sundials), Cint, (Cint, Ptr{realtype}, Ptr{N_Vector}, N_Vector), nvec, c, X, z)
end

function N_VLinearCombination(nvec, c, X, z)
    __z = convert(NVector, z)
    N_VLinearCombination(convert(Cint, nvec), c, X, convert(N_Vector, __z))
end

function N_VScaleAddMulti(nvec::Cint, a, x::N_Vector, Y, Z)
    ccall((:N_VScaleAddMulti, libsundials_sundials), Cint, (Cint, Ptr{realtype}, N_Vector, Ptr{N_Vector}, Ptr{N_Vector}), nvec, a, x, Y, Z)
end

function N_VScaleAddMulti(nvec, a, x, Y, Z)
    __x = convert(NVector, x)
    N_VScaleAddMulti(convert(Cint, nvec), a, convert(N_Vector, __x), Y, Z)
end

function N_VDotProdMulti(nvec::Cint, x::N_Vector, Y, dotprods)
    ccall((:N_VDotProdMulti, libsundials_sundials), Cint, (Cint, N_Vector, Ptr{N_Vector}, Ptr{realtype}), nvec, x, Y, dotprods)
end

function N_VDotProdMulti(nvec, x, Y, dotprods)
    __x = convert(NVector, x)
    N_VDotProdMulti(convert(Cint, nvec), convert(N_Vector, __x), Y, dotprods)
end

function N_VLinearSumVectorArray(nvec::Cint, a::realtype, X, b::realtype, Y, Z)
    ccall((:N_VLinearSumVectorArray, libsundials_sundials), Cint, (Cint, realtype, Ptr{N_Vector}, realtype, Ptr{N_Vector}, Ptr{N_Vector}), nvec, a, X, b, Y, Z)
end

function N_VLinearSumVectorArray(nvec, a, X, b, Y, Z)
    N_VLinearSumVectorArray(convert(Cint, nvec), a, X, b, Y, Z)
end

function N_VScaleVectorArray(nvec::Cint, c, X, Z)
    ccall((:N_VScaleVectorArray, libsundials_sundials), Cint, (Cint, Ptr{realtype}, Ptr{N_Vector}, Ptr{N_Vector}), nvec, c, X, Z)
end

function N_VScaleVectorArray(nvec, c, X, Z)
    N_VScaleVectorArray(convert(Cint, nvec), c, X, Z)
end

function N_VConstVectorArray(nvec::Cint, c::realtype, Z)
    ccall((:N_VConstVectorArray, libsundials_sundials), Cint, (Cint, realtype, Ptr{N_Vector}), nvec, c, Z)
end

function N_VConstVectorArray(nvec, c, Z)
    N_VConstVectorArray(convert(Cint, nvec), c, Z)
end

function N_VWrmsNormVectorArray(nvec::Cint, X, W, nrm)
    ccall((:N_VWrmsNormVectorArray, libsundials_sundials), Cint, (Cint, Ptr{N_Vector}, Ptr{N_Vector}, Ptr{realtype}), nvec, X, W, nrm)
end

function N_VWrmsNormVectorArray(nvec, X, W, nrm)
    N_VWrmsNormVectorArray(convert(Cint, nvec), X, W, nrm)
end

function N_VWrmsNormMaskVectorArray(nvec::Cint, X, W, id::N_Vector, nrm)
    ccall((:N_VWrmsNormMaskVectorArray, libsundials_sundials), Cint, (Cint, Ptr{N_Vector}, Ptr{N_Vector}, N_Vector, Ptr{realtype}), nvec, X, W, id, nrm)
end

function N_VWrmsNormMaskVectorArray(nvec, X, W, id, nrm)
    __id = convert(NVector, id)
    N_VWrmsNormMaskVectorArray(convert(Cint, nvec), X, W, convert(N_Vector, __id), nrm)
end

function N_VScaleAddMultiVectorArray(nvec::Cint, nsum::Cint, a, X, Y, Z)
    ccall((:N_VScaleAddMultiVectorArray, libsundials_sundials), Cint, (Cint, Cint, Ptr{realtype}, Ptr{N_Vector}, Ptr{Ptr{N_Vector}}, Ptr{Ptr{N_Vector}}), nvec, nsum, a, X, Y, Z)
end

function N_VScaleAddMultiVectorArray(nvec, nsum, a, X, Y, Z)
    N_VScaleAddMultiVectorArray(convert(Cint, nvec), convert(Cint, nsum), a, X, Y, Z)
end

function N_VLinearCombinationVectorArray(nvec::Cint, nsum::Cint, c, X, Z)
    ccall((:N_VLinearCombinationVectorArray, libsundials_sundials), Cint, (Cint, Cint, Ptr{realtype}, Ptr{Ptr{N_Vector}}, Ptr{N_Vector}), nvec, nsum, c, X, Z)
end

function N_VLinearCombinationVectorArray(nvec, nsum, c, X, Z)
    N_VLinearCombinationVectorArray(convert(Cint, nvec), convert(Cint, nsum), c, X, Z)
end

function N_VDotProdLocal(x::N_Vector, y::N_Vector)
    ccall((:N_VDotProdLocal, libsundials_sundials), realtype, (N_Vector, N_Vector), x, y)
end

function N_VDotProdLocal(x, y)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    N_VDotProdLocal(convert(N_Vector, __x), convert(N_Vector, __y))
end

function N_VMaxNormLocal(x::N_Vector)
    ccall((:N_VMaxNormLocal, libsundials_sundials), realtype, (N_Vector,), x)
end

function N_VMaxNormLocal(x)
    __x = convert(NVector, x)
    N_VMaxNormLocal(convert(N_Vector, __x))
end

function N_VMinLocal(x::N_Vector)
    ccall((:N_VMinLocal, libsundials_sundials), realtype, (N_Vector,), x)
end

function N_VMinLocal(x)
    __x = convert(NVector, x)
    N_VMinLocal(convert(N_Vector, __x))
end

function N_VL1NormLocal(x::N_Vector)
    ccall((:N_VL1NormLocal, libsundials_sundials), realtype, (N_Vector,), x)
end

function N_VL1NormLocal(x)
    __x = convert(NVector, x)
    N_VL1NormLocal(convert(N_Vector, __x))
end

function N_VWSqrSumLocal(x::N_Vector, w::N_Vector)
    ccall((:N_VWSqrSumLocal, libsundials_sundials), realtype, (N_Vector, N_Vector), x, w)
end

function N_VWSqrSumLocal(x, w)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    N_VWSqrSumLocal(convert(N_Vector, __x), convert(N_Vector, __w))
end

function N_VWSqrSumMaskLocal(x::N_Vector, w::N_Vector, id::N_Vector)
    ccall((:N_VWSqrSumMaskLocal, libsundials_sundials), realtype, (N_Vector, N_Vector, N_Vector), x, w, id)
end

function N_VWSqrSumMaskLocal(x, w, id)
    __x = convert(NVector, x)
    __w = convert(NVector, w)
    __id = convert(NVector, id)
    N_VWSqrSumMaskLocal(convert(N_Vector, __x), convert(N_Vector, __w), convert(N_Vector, __id))
end

function N_VInvTestLocal(x::N_Vector, z::N_Vector)
    ccall((:N_VInvTestLocal, libsundials_sundials), Cint, (N_Vector, N_Vector), x, z)
end

function N_VInvTestLocal(x, z)
    __x = convert(NVector, x)
    __z = convert(NVector, z)
    N_VInvTestLocal(convert(N_Vector, __x), convert(N_Vector, __z))
end

function N_VConstrMaskLocal(c::N_Vector, x::N_Vector, m::N_Vector)
    ccall((:N_VConstrMaskLocal, libsundials_sundials), Cint, (N_Vector, N_Vector, N_Vector), c, x, m)
end

function N_VConstrMaskLocal(c, x, m)
    __c = convert(NVector, c)
    __x = convert(NVector, x)
    __m = convert(NVector, m)
    N_VConstrMaskLocal(convert(N_Vector, __c), convert(N_Vector, __x), convert(N_Vector, __m))
end

function N_VMinQuotientLocal(num::N_Vector, denom::N_Vector)
    ccall((:N_VMinQuotientLocal, libsundials_sundials), realtype, (N_Vector, N_Vector), num, denom)
end

function N_VMinQuotientLocal(num, denom)
    __num = convert(NVector, num)
    __denom = convert(NVector, denom)
    N_VMinQuotientLocal(convert(N_Vector, __num), convert(N_Vector, __denom))
end

function N_VNewVectorArray(count::Cint)
    ccall((:N_VNewVectorArray, libsundials_sundials), Ptr{N_Vector}, (Cint,), count)
end

function N_VNewVectorArray(count)
    N_VNewVectorArray(convert(Cint, count))
end

function N_VCloneEmptyVectorArray(count::Cint, w::N_Vector)
    ccall((:N_VCloneEmptyVectorArray, libsundials_sundials), Ptr{N_Vector}, (Cint, N_Vector), count, w)
end

function N_VCloneEmptyVectorArray(count, w)
    __w = convert(NVector, w)
    N_VCloneEmptyVectorArray(convert(Cint, count), convert(N_Vector, __w))
end

function N_VCloneVectorArray(count::Cint, w::N_Vector)
    ccall((:N_VCloneVectorArray, libsundials_sundials), Ptr{N_Vector}, (Cint, N_Vector), count, w)
end

function N_VCloneVectorArray(count, w)
    __w = convert(NVector, w)
    N_VCloneVectorArray(convert(Cint, count), convert(N_Vector, __w))
end

function N_VDestroyVectorArray(vs, count::Cint)
    ccall((:N_VDestroyVectorArray, libsundials_sundials), Cvoid, (Ptr{N_Vector}, Cint), vs, count)
end

function N_VDestroyVectorArray(vs, count)
    N_VDestroyVectorArray(vs, convert(Cint, count))
end

function N_VGetVecAtIndexVectorArray(vs, index::Cint)
    ccall((:N_VGetVecAtIndexVectorArray, libsundials_sundials), N_Vector, (Ptr{N_Vector}, Cint), vs, index)
end

function N_VGetVecAtIndexVectorArray(vs, index)
    N_VGetVecAtIndexVectorArray(vs, convert(Cint, index))
end

function N_VSetVecAtIndexVectorArray(vs, index::Cint, w::N_Vector)
    ccall((:N_VSetVecAtIndexVectorArray, libsundials_sundials), Cvoid, (Ptr{N_Vector}, Cint, N_Vector), vs, index, w)
end

function N_VSetVecAtIndexVectorArray(vs, index, w)
    __w = convert(NVector, w)
    N_VSetVecAtIndexVectorArray(vs, convert(Cint, index), convert(N_Vector, __w))
end

function SUNDIALSGetVersion(version, len::Cint)
    ccall((:SUNDIALSGetVersion, libsundials_sundials), Cint, (Cstring, Cint), version, len)
end

function SUNDIALSGetVersion(version, len)
    SUNDIALSGetVersion(version, convert(Cint, len))
end

function SUNDIALSGetVersionNumber(major, minor, patch, label, len::Cint)
    ccall((:SUNDIALSGetVersionNumber, libsundials_sundials), Cint, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cstring, Cint), major, minor, patch, label, len)
end

function SUNDIALSGetVersionNumber(major, minor, patch, label, len)
    SUNDIALSGetVersionNumber(major, minor, patch, label, convert(Cint, len))
end

function SUNLinSol_Band(y::N_Vector, A::SUNMatrix)
    ccall((:SUNLinSol_Band, libsundials_sunlinsolband), SUNLinearSolver, (N_Vector, SUNMatrix), y, A)
end

function SUNLinSol_Band(y, A)
    __y = convert(NVector, y)
    SUNLinSol_Band(convert(N_Vector, __y), A)
end

function SUNBandLinearSolver(y::N_Vector, A::SUNMatrix)
    ccall((:SUNBandLinearSolver, libsundials_sunlinsolband), SUNLinearSolver, (N_Vector, SUNMatrix), y, A)
end

function SUNBandLinearSolver(y, A)
    __y = convert(NVector, y)
    SUNBandLinearSolver(convert(N_Vector, __y), A)
end

function SUNLinSolGetType_Band(S::SUNLinearSolver)
    ccall((:SUNLinSolGetType_Band, libsundials_sunlinsolband), SUNLinearSolver_Type, (SUNLinearSolver,), S)
end

function SUNLinSolGetID_Band(S::SUNLinearSolver)
    ccall((:SUNLinSolGetID_Band, libsundials_sunlinsolband), SUNLinearSolver_ID, (SUNLinearSolver,), S)
end

function SUNLinSolInitialize_Band(S::SUNLinearSolver)
    ccall((:SUNLinSolInitialize_Band, libsundials_sunlinsolband), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolSetup_Band(S::SUNLinearSolver, A::SUNMatrix)
    ccall((:SUNLinSolSetup_Band, libsundials_sunlinsolband), Cint, (SUNLinearSolver, SUNMatrix), S, A)
end

function SUNLinSolSolve_Band(S::SUNLinearSolver, A::SUNMatrix, x::N_Vector, b::N_Vector, tol::realtype)
    ccall((:SUNLinSolSolve_Band, libsundials_sunlinsolband), Cint, (SUNLinearSolver, SUNMatrix, N_Vector, N_Vector, realtype), S, A, x, b, tol)
end

function SUNLinSolSolve_Band(S, A, x, b, tol)
    __x = convert(NVector, x)
    __b = convert(NVector, b)
    SUNLinSolSolve_Band(S, A, convert(N_Vector, __x), convert(N_Vector, __b), tol)
end

function SUNLinSolLastFlag_Band(S::SUNLinearSolver)
    ccall((:SUNLinSolLastFlag_Band, libsundials_sunlinsolband), sunindextype, (SUNLinearSolver,), S)
end

function SUNLinSolSpace_Band(S::SUNLinearSolver, lenrwLS, leniwLS)
    ccall((:SUNLinSolSpace_Band, libsundials_sunlinsolband), Cint, (SUNLinearSolver, Ptr{Clong}, Ptr{Clong}), S, lenrwLS, leniwLS)
end

function SUNLinSolFree_Band(S::SUNLinearSolver)
    ccall((:SUNLinSolFree_Band, libsundials_sunlinsolband), Cint, (SUNLinearSolver,), S)
end

function SUNLinSol_Dense(y::N_Vector, A::SUNMatrix)
    ccall((:SUNLinSol_Dense, libsundials_sunlinsoldense), SUNLinearSolver, (N_Vector, SUNMatrix), y, A)
end

function SUNLinSol_Dense(y, A)
    __y = convert(NVector, y)
    SUNLinSol_Dense(convert(N_Vector, __y), A)
end

function SUNDenseLinearSolver(y::N_Vector, A::SUNMatrix)
    ccall((:SUNDenseLinearSolver, libsundials_sunlinsoldense), SUNLinearSolver, (N_Vector, SUNMatrix), y, A)
end

function SUNDenseLinearSolver(y, A)
    __y = convert(NVector, y)
    SUNDenseLinearSolver(convert(N_Vector, __y), A)
end

function SUNLinSolGetType_Dense(S::SUNLinearSolver)
    ccall((:SUNLinSolGetType_Dense, libsundials_sunlinsoldense), SUNLinearSolver_Type, (SUNLinearSolver,), S)
end

function SUNLinSolGetID_Dense(S::SUNLinearSolver)
    ccall((:SUNLinSolGetID_Dense, libsundials_sunlinsoldense), SUNLinearSolver_ID, (SUNLinearSolver,), S)
end

function SUNLinSolInitialize_Dense(S::SUNLinearSolver)
    ccall((:SUNLinSolInitialize_Dense, libsundials_sunlinsoldense), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolSetup_Dense(S::SUNLinearSolver, A::SUNMatrix)
    ccall((:SUNLinSolSetup_Dense, libsundials_sunlinsoldense), Cint, (SUNLinearSolver, SUNMatrix), S, A)
end

function SUNLinSolSolve_Dense(S::SUNLinearSolver, A::SUNMatrix, x::N_Vector, b::N_Vector, tol::realtype)
    ccall((:SUNLinSolSolve_Dense, libsundials_sunlinsoldense), Cint, (SUNLinearSolver, SUNMatrix, N_Vector, N_Vector, realtype), S, A, x, b, tol)
end

function SUNLinSolSolve_Dense(S, A, x, b, tol)
    __x = convert(NVector, x)
    __b = convert(NVector, b)
    SUNLinSolSolve_Dense(S, A, convert(N_Vector, __x), convert(N_Vector, __b), tol)
end

function SUNLinSolLastFlag_Dense(S::SUNLinearSolver)
    ccall((:SUNLinSolLastFlag_Dense, libsundials_sunlinsoldense), sunindextype, (SUNLinearSolver,), S)
end

function SUNLinSolSpace_Dense(S::SUNLinearSolver, lenrwLS, leniwLS)
    ccall((:SUNLinSolSpace_Dense, libsundials_sunlinsoldense), Cint, (SUNLinearSolver, Ptr{Clong}, Ptr{Clong}), S, lenrwLS, leniwLS)
end

function SUNLinSolFree_Dense(S::SUNLinearSolver)
    ccall((:SUNLinSolFree_Dense, libsundials_sunlinsoldense), Cint, (SUNLinearSolver,), S)
end

function SUNLinSol_KLU(y::N_Vector, A::SUNMatrix)
    ccall((:SUNLinSol_KLU, libsundials_sunlinsolklu), SUNLinearSolver, (N_Vector, SUNMatrix), y, A)
end

function SUNLinSol_KLU(y, A)
    __y = convert(NVector, y)
    SUNLinSol_KLU(convert(N_Vector, __y), A)
end

function SUNLinSol_KLUReInit(S::SUNLinearSolver, A::SUNMatrix, nnz::sunindextype, reinit_type::Cint)
    ccall((:SUNLinSol_KLUReInit, libsundials_sunlinsolklu), Cint, (SUNLinearSolver, SUNMatrix, sunindextype, Cint), S, A, nnz, reinit_type)
end

function SUNLinSol_KLUReInit(S, A, nnz, reinit_type)
    SUNLinSol_KLUReInit(S, A, nnz, convert(Cint, reinit_type))
end

function SUNLinSol_KLUSetOrdering(S::SUNLinearSolver, ordering_choice::Cint)
    ccall((:SUNLinSol_KLUSetOrdering, libsundials_sunlinsolklu), Cint, (SUNLinearSolver, Cint), S, ordering_choice)
end

function SUNLinSol_KLUSetOrdering(S, ordering_choice)
    SUNLinSol_KLUSetOrdering(S, convert(Cint, ordering_choice))
end

function SUNKLU(y::N_Vector, A::SUNMatrix)
    ccall((:SUNKLU, libsundials_sunlinsolklu), SUNLinearSolver, (N_Vector, SUNMatrix), y, A)
end

function SUNKLU(y, A)
    __y = convert(NVector, y)
    SUNKLU(convert(N_Vector, __y), A)
end

function SUNKLUReInit(S::SUNLinearSolver, A::SUNMatrix, nnz::sunindextype, reinit_type::Cint)
    ccall((:SUNKLUReInit, libsundials_sunlinsolklu), Cint, (SUNLinearSolver, SUNMatrix, sunindextype, Cint), S, A, nnz, reinit_type)
end

function SUNKLUReInit(S, A, nnz, reinit_type)
    SUNKLUReInit(S, A, nnz, convert(Cint, reinit_type))
end

function SUNKLUSetOrdering(S::SUNLinearSolver, ordering_choice::Cint)
    ccall((:SUNKLUSetOrdering, libsundials_sunlinsolklu), Cint, (SUNLinearSolver, Cint), S, ordering_choice)
end

function SUNKLUSetOrdering(S, ordering_choice)
    SUNKLUSetOrdering(S, convert(Cint, ordering_choice))
end

function SUNLinSol_KLUGetSymbolic(S::SUNLinearSolver)
    ccall((:SUNLinSol_KLUGetSymbolic, libsundials_sunlinsolklu), Ptr{klu_l_symbolic}, (SUNLinearSolver,), S)
end

function SUNLinSol_KLUGetNumeric(S::SUNLinearSolver)
    ccall((:SUNLinSol_KLUGetNumeric, libsundials_sunlinsolklu), Ptr{klu_l_numeric}, (SUNLinearSolver,), S)
end

function SUNLinSol_KLUGetCommon(S::SUNLinearSolver)
    ccall((:SUNLinSol_KLUGetCommon, libsundials_sunlinsolklu), Ptr{klu_l_common}, (SUNLinearSolver,), S)
end

function SUNLinSolGetType_KLU(S::SUNLinearSolver)
    ccall((:SUNLinSolGetType_KLU, libsundials_sunlinsolklu), SUNLinearSolver_Type, (SUNLinearSolver,), S)
end

function SUNLinSolGetID_KLU(S::SUNLinearSolver)
    ccall((:SUNLinSolGetID_KLU, libsundials_sunlinsolklu), SUNLinearSolver_ID, (SUNLinearSolver,), S)
end

function SUNLinSolInitialize_KLU(S::SUNLinearSolver)
    ccall((:SUNLinSolInitialize_KLU, libsundials_sunlinsolklu), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolSetup_KLU(S::SUNLinearSolver, A::SUNMatrix)
    ccall((:SUNLinSolSetup_KLU, libsundials_sunlinsolklu), Cint, (SUNLinearSolver, SUNMatrix), S, A)
end

function SUNLinSolSolve_KLU(S::SUNLinearSolver, A::SUNMatrix, x::N_Vector, b::N_Vector, tol::realtype)
    ccall((:SUNLinSolSolve_KLU, libsundials_sunlinsolklu), Cint, (SUNLinearSolver, SUNMatrix, N_Vector, N_Vector, realtype), S, A, x, b, tol)
end

function SUNLinSolSolve_KLU(S, A, x, b, tol)
    __x = convert(NVector, x)
    __b = convert(NVector, b)
    SUNLinSolSolve_KLU(S, A, convert(N_Vector, __x), convert(N_Vector, __b), tol)
end

function SUNLinSolLastFlag_KLU(S::SUNLinearSolver)
    ccall((:SUNLinSolLastFlag_KLU, libsundials_sunlinsolklu), sunindextype, (SUNLinearSolver,), S)
end

function SUNLinSolSpace_KLU(S::SUNLinearSolver, lenrwLS, leniwLS)
    ccall((:SUNLinSolSpace_KLU, libsundials_sunlinsolklu), Cint, (SUNLinearSolver, Ptr{Clong}, Ptr{Clong}), S, lenrwLS, leniwLS)
end

function SUNLinSolFree_KLU(S::SUNLinearSolver)
    ccall((:SUNLinSolFree_KLU, libsundials_sunlinsolklu), Cint, (SUNLinearSolver,), S)
end

function SUNLinSol_LapackBand(y::N_Vector, A::SUNMatrix)
    ccall((:SUNLinSol_LapackBand, libsundials_sunlinsollapackband), SUNLinearSolver, (N_Vector, SUNMatrix), y, A)
end

function SUNLinSol_LapackBand(y, A)
    __y = convert(NVector, y)
    SUNLinSol_LapackBand(convert(N_Vector, __y), A)
end

function SUNLapackBand(y::N_Vector, A::SUNMatrix)
    ccall((:SUNLapackBand, libsundials_sunlinsollapackband), SUNLinearSolver, (N_Vector, SUNMatrix), y, A)
end

function SUNLapackBand(y, A)
    __y = convert(NVector, y)
    SUNLapackBand(convert(N_Vector, __y), A)
end

function SUNLinSolGetType_LapackBand(S::SUNLinearSolver)
    ccall((:SUNLinSolGetType_LapackBand, libsundials_sunlinsollapackband), SUNLinearSolver_Type, (SUNLinearSolver,), S)
end

function SUNLinSolGetID_LapackBand(S::SUNLinearSolver)
    ccall((:SUNLinSolGetID_LapackBand, libsundials_sunlinsollapackband), SUNLinearSolver_ID, (SUNLinearSolver,), S)
end

function SUNLinSolInitialize_LapackBand(S::SUNLinearSolver)
    ccall((:SUNLinSolInitialize_LapackBand, libsundials_sunlinsollapackband), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolSetup_LapackBand(S::SUNLinearSolver, A::SUNMatrix)
    ccall((:SUNLinSolSetup_LapackBand, libsundials_sunlinsollapackband), Cint, (SUNLinearSolver, SUNMatrix), S, A)
end

function SUNLinSolSolve_LapackBand(S::SUNLinearSolver, A::SUNMatrix, x::N_Vector, b::N_Vector, tol::realtype)
    ccall((:SUNLinSolSolve_LapackBand, libsundials_sunlinsollapackband), Cint, (SUNLinearSolver, SUNMatrix, N_Vector, N_Vector, realtype), S, A, x, b, tol)
end

function SUNLinSolSolve_LapackBand(S, A, x, b, tol)
    __x = convert(NVector, x)
    __b = convert(NVector, b)
    SUNLinSolSolve_LapackBand(S, A, convert(N_Vector, __x), convert(N_Vector, __b), tol)
end

function SUNLinSolLastFlag_LapackBand(S::SUNLinearSolver)
    ccall((:SUNLinSolLastFlag_LapackBand, libsundials_sunlinsollapackband), sunindextype, (SUNLinearSolver,), S)
end

function SUNLinSolSpace_LapackBand(S::SUNLinearSolver, lenrwLS, leniwLS)
    ccall((:SUNLinSolSpace_LapackBand, libsundials_sunlinsollapackband), Cint, (SUNLinearSolver, Ptr{Clong}, Ptr{Clong}), S, lenrwLS, leniwLS)
end

function SUNLinSolFree_LapackBand(S::SUNLinearSolver)
    ccall((:SUNLinSolFree_LapackBand, libsundials_sunlinsollapackband), Cint, (SUNLinearSolver,), S)
end

function SUNLinSol_LapackDense(y::N_Vector, A::SUNMatrix)
    ccall((:SUNLinSol_LapackDense, libsundials_sunlinsollapackdense), SUNLinearSolver, (N_Vector, SUNMatrix), y, A)
end

function SUNLinSol_LapackDense(y, A)
    __y = convert(NVector, y)
    SUNLinSol_LapackDense(convert(N_Vector, __y), A)
end

function SUNLapackDense(y::N_Vector, A::SUNMatrix)
    ccall((:SUNLapackDense, libsundials_sunlinsollapackdense), SUNLinearSolver, (N_Vector, SUNMatrix), y, A)
end

function SUNLapackDense(y, A)
    __y = convert(NVector, y)
    SUNLapackDense(convert(N_Vector, __y), A)
end

function SUNLinSolGetType_LapackDense(S::SUNLinearSolver)
    ccall((:SUNLinSolGetType_LapackDense, libsundials_sunlinsollapackdense), SUNLinearSolver_Type, (SUNLinearSolver,), S)
end

function SUNLinSolGetID_LapackDense(S::SUNLinearSolver)
    ccall((:SUNLinSolGetID_LapackDense, libsundials_sunlinsollapackdense), SUNLinearSolver_ID, (SUNLinearSolver,), S)
end

function SUNLinSolInitialize_LapackDense(S::SUNLinearSolver)
    ccall((:SUNLinSolInitialize_LapackDense, libsundials_sunlinsollapackdense), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolSetup_LapackDense(S::SUNLinearSolver, A::SUNMatrix)
    ccall((:SUNLinSolSetup_LapackDense, libsundials_sunlinsollapackdense), Cint, (SUNLinearSolver, SUNMatrix), S, A)
end

function SUNLinSolSolve_LapackDense(S::SUNLinearSolver, A::SUNMatrix, x::N_Vector, b::N_Vector, tol::realtype)
    ccall((:SUNLinSolSolve_LapackDense, libsundials_sunlinsollapackdense), Cint, (SUNLinearSolver, SUNMatrix, N_Vector, N_Vector, realtype), S, A, x, b, tol)
end

function SUNLinSolSolve_LapackDense(S, A, x, b, tol)
    __x = convert(NVector, x)
    __b = convert(NVector, b)
    SUNLinSolSolve_LapackDense(S, A, convert(N_Vector, __x), convert(N_Vector, __b), tol)
end

function SUNLinSolLastFlag_LapackDense(S::SUNLinearSolver)
    ccall((:SUNLinSolLastFlag_LapackDense, libsundials_sunlinsollapackdense), sunindextype, (SUNLinearSolver,), S)
end

function SUNLinSolSpace_LapackDense(S::SUNLinearSolver, lenrwLS, leniwLS)
    ccall((:SUNLinSolSpace_LapackDense, libsundials_sunlinsollapackdense), Cint, (SUNLinearSolver, Ptr{Clong}, Ptr{Clong}), S, lenrwLS, leniwLS)
end

function SUNLinSolFree_LapackDense(S::SUNLinearSolver)
    ccall((:SUNLinSolFree_LapackDense, libsundials_sunlinsollapackdense), Cint, (SUNLinearSolver,), S)
end

function SUNLinSol_PCG(y::N_Vector, pretype::Cint, maxl::Cint)
    ccall((:SUNLinSol_PCG, libsundials_sunlinsolpcg), SUNLinearSolver, (N_Vector, Cint, Cint), y, pretype, maxl)
end

function SUNLinSol_PCG(y, pretype, maxl)
    __y = convert(NVector, y)
    SUNLinSol_PCG(convert(N_Vector, __y), convert(Cint, pretype), convert(Cint, maxl))
end

function SUNLinSol_PCGSetPrecType(S::SUNLinearSolver, pretype::Cint)
    ccall((:SUNLinSol_PCGSetPrecType, libsundials_sunlinsolpcg), Cint, (SUNLinearSolver, Cint), S, pretype)
end

function SUNLinSol_PCGSetPrecType(S, pretype)
    SUNLinSol_PCGSetPrecType(S, convert(Cint, pretype))
end

function SUNLinSol_PCGSetMaxl(S::SUNLinearSolver, maxl::Cint)
    ccall((:SUNLinSol_PCGSetMaxl, libsundials_sunlinsolpcg), Cint, (SUNLinearSolver, Cint), S, maxl)
end

function SUNLinSol_PCGSetMaxl(S, maxl)
    SUNLinSol_PCGSetMaxl(S, convert(Cint, maxl))
end

function SUNPCG(y::N_Vector, pretype::Cint, maxl::Cint)
    ccall((:SUNPCG, libsundials_sunlinsolpcg), SUNLinearSolver, (N_Vector, Cint, Cint), y, pretype, maxl)
end

function SUNPCG(y, pretype, maxl)
    __y = convert(NVector, y)
    SUNPCG(convert(N_Vector, __y), convert(Cint, pretype), convert(Cint, maxl))
end

function SUNPCGSetPrecType(S::SUNLinearSolver, pretype::Cint)
    ccall((:SUNPCGSetPrecType, libsundials_sunlinsolpcg), Cint, (SUNLinearSolver, Cint), S, pretype)
end

function SUNPCGSetPrecType(S, pretype)
    SUNPCGSetPrecType(S, convert(Cint, pretype))
end

function SUNPCGSetMaxl(S::SUNLinearSolver, maxl::Cint)
    ccall((:SUNPCGSetMaxl, libsundials_sunlinsolpcg), Cint, (SUNLinearSolver, Cint), S, maxl)
end

function SUNPCGSetMaxl(S, maxl)
    SUNPCGSetMaxl(S, convert(Cint, maxl))
end

function SUNLinSolGetType_PCG(S::SUNLinearSolver)
    ccall((:SUNLinSolGetType_PCG, libsundials_sunlinsolpcg), SUNLinearSolver_Type, (SUNLinearSolver,), S)
end

function SUNLinSolGetID_PCG(S::SUNLinearSolver)
    ccall((:SUNLinSolGetID_PCG, libsundials_sunlinsolpcg), SUNLinearSolver_ID, (SUNLinearSolver,), S)
end

function SUNLinSolInitialize_PCG(S::SUNLinearSolver)
    ccall((:SUNLinSolInitialize_PCG, libsundials_sunlinsolpcg), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolSetATimes_PCG(S::SUNLinearSolver, A_data, ATimes::ATimesFn)
    ccall((:SUNLinSolSetATimes_PCG, libsundials_sunlinsolpcg), Cint, (SUNLinearSolver, Ptr{Cvoid}, ATimesFn), S, A_data, ATimes)
end

function SUNLinSolSetPreconditioner_PCG(S::SUNLinearSolver, P_data, Pset::PSetupFn, Psol::PSolveFn)
    ccall((:SUNLinSolSetPreconditioner_PCG, libsundials_sunlinsolpcg), Cint, (SUNLinearSolver, Ptr{Cvoid}, PSetupFn, PSolveFn), S, P_data, Pset, Psol)
end

function SUNLinSolSetScalingVectors_PCG(S::SUNLinearSolver, s::N_Vector, nul::N_Vector)
    ccall((:SUNLinSolSetScalingVectors_PCG, libsundials_sunlinsolpcg), Cint, (SUNLinearSolver, N_Vector, N_Vector), S, s, nul)
end

function SUNLinSolSetScalingVectors_PCG(S, s, nul)
    __s = convert(NVector, s)
    __nul = convert(NVector, nul)
    SUNLinSolSetScalingVectors_PCG(S, convert(N_Vector, __s), convert(N_Vector, __nul))
end

function SUNLinSolSetup_PCG(S::SUNLinearSolver, nul::SUNMatrix)
    ccall((:SUNLinSolSetup_PCG, libsundials_sunlinsolpcg), Cint, (SUNLinearSolver, SUNMatrix), S, nul)
end

function SUNLinSolSolve_PCG(S::SUNLinearSolver, nul::SUNMatrix, x::N_Vector, b::N_Vector, tol::realtype)
    ccall((:SUNLinSolSolve_PCG, libsundials_sunlinsolpcg), Cint, (SUNLinearSolver, SUNMatrix, N_Vector, N_Vector, realtype), S, nul, x, b, tol)
end

function SUNLinSolSolve_PCG(S, nul, x, b, tol)
    __x = convert(NVector, x)
    __b = convert(NVector, b)
    SUNLinSolSolve_PCG(S, nul, convert(N_Vector, __x), convert(N_Vector, __b), tol)
end

function SUNLinSolNumIters_PCG(S::SUNLinearSolver)
    ccall((:SUNLinSolNumIters_PCG, libsundials_sunlinsolpcg), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolResNorm_PCG(S::SUNLinearSolver)
    ccall((:SUNLinSolResNorm_PCG, libsundials_sunlinsolpcg), realtype, (SUNLinearSolver,), S)
end

function SUNLinSolResid_PCG(S::SUNLinearSolver)
    ccall((:SUNLinSolResid_PCG, libsundials_sunlinsolpcg), N_Vector, (SUNLinearSolver,), S)
end

function SUNLinSolLastFlag_PCG(S::SUNLinearSolver)
    ccall((:SUNLinSolLastFlag_PCG, libsundials_sunlinsolpcg), sunindextype, (SUNLinearSolver,), S)
end

function SUNLinSolSpace_PCG(S::SUNLinearSolver, lenrwLS, leniwLS)
    ccall((:SUNLinSolSpace_PCG, libsundials_sunlinsolpcg), Cint, (SUNLinearSolver, Ptr{Clong}, Ptr{Clong}), S, lenrwLS, leniwLS)
end

function SUNLinSolFree_PCG(S::SUNLinearSolver)
    ccall((:SUNLinSolFree_PCG, libsundials_sunlinsolpcg), Cint, (SUNLinearSolver,), S)
end

function SUNLinSol_SPBCGS(y::N_Vector, pretype::Cint, maxl::Cint)
    ccall((:SUNLinSol_SPBCGS, libsundials_sunlinsolspbcgs), SUNLinearSolver, (N_Vector, Cint, Cint), y, pretype, maxl)
end

function SUNLinSol_SPBCGS(y, pretype, maxl)
    __y = convert(NVector, y)
    SUNLinSol_SPBCGS(convert(N_Vector, __y), convert(Cint, pretype), convert(Cint, maxl))
end

function SUNLinSol_SPBCGSSetPrecType(S::SUNLinearSolver, pretype::Cint)
    ccall((:SUNLinSol_SPBCGSSetPrecType, libsundials_sunlinsolspbcgs), Cint, (SUNLinearSolver, Cint), S, pretype)
end

function SUNLinSol_SPBCGSSetPrecType(S, pretype)
    SUNLinSol_SPBCGSSetPrecType(S, convert(Cint, pretype))
end

function SUNLinSol_SPBCGSSetMaxl(S::SUNLinearSolver, maxl::Cint)
    ccall((:SUNLinSol_SPBCGSSetMaxl, libsundials_sunlinsolspbcgs), Cint, (SUNLinearSolver, Cint), S, maxl)
end

function SUNLinSol_SPBCGSSetMaxl(S, maxl)
    SUNLinSol_SPBCGSSetMaxl(S, convert(Cint, maxl))
end

function SUNSPBCGS(y::N_Vector, pretype::Cint, maxl::Cint)
    ccall((:SUNSPBCGS, libsundials_sunlinsolspbcgs), SUNLinearSolver, (N_Vector, Cint, Cint), y, pretype, maxl)
end

function SUNSPBCGS(y, pretype, maxl)
    __y = convert(NVector, y)
    SUNSPBCGS(convert(N_Vector, __y), convert(Cint, pretype), convert(Cint, maxl))
end

function SUNSPBCGSSetPrecType(S::SUNLinearSolver, pretype::Cint)
    ccall((:SUNSPBCGSSetPrecType, libsundials_sunlinsolspbcgs), Cint, (SUNLinearSolver, Cint), S, pretype)
end

function SUNSPBCGSSetPrecType(S, pretype)
    SUNSPBCGSSetPrecType(S, convert(Cint, pretype))
end

function SUNSPBCGSSetMaxl(S::SUNLinearSolver, maxl::Cint)
    ccall((:SUNSPBCGSSetMaxl, libsundials_sunlinsolspbcgs), Cint, (SUNLinearSolver, Cint), S, maxl)
end

function SUNSPBCGSSetMaxl(S, maxl)
    SUNSPBCGSSetMaxl(S, convert(Cint, maxl))
end

function SUNLinSolGetType_SPBCGS(S::SUNLinearSolver)
    ccall((:SUNLinSolGetType_SPBCGS, libsundials_sunlinsolspbcgs), SUNLinearSolver_Type, (SUNLinearSolver,), S)
end

function SUNLinSolGetID_SPBCGS(S::SUNLinearSolver)
    ccall((:SUNLinSolGetID_SPBCGS, libsundials_sunlinsolspbcgs), SUNLinearSolver_ID, (SUNLinearSolver,), S)
end

function SUNLinSolInitialize_SPBCGS(S::SUNLinearSolver)
    ccall((:SUNLinSolInitialize_SPBCGS, libsundials_sunlinsolspbcgs), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolSetATimes_SPBCGS(S::SUNLinearSolver, A_data, ATimes::ATimesFn)
    ccall((:SUNLinSolSetATimes_SPBCGS, libsundials_sunlinsolspbcgs), Cint, (SUNLinearSolver, Ptr{Cvoid}, ATimesFn), S, A_data, ATimes)
end

function SUNLinSolSetPreconditioner_SPBCGS(S::SUNLinearSolver, P_data, Pset::PSetupFn, Psol::PSolveFn)
    ccall((:SUNLinSolSetPreconditioner_SPBCGS, libsundials_sunlinsolspbcgs), Cint, (SUNLinearSolver, Ptr{Cvoid}, PSetupFn, PSolveFn), S, P_data, Pset, Psol)
end

function SUNLinSolSetScalingVectors_SPBCGS(S::SUNLinearSolver, s1::N_Vector, s2::N_Vector)
    ccall((:SUNLinSolSetScalingVectors_SPBCGS, libsundials_sunlinsolspbcgs), Cint, (SUNLinearSolver, N_Vector, N_Vector), S, s1, s2)
end

function SUNLinSolSetScalingVectors_SPBCGS(S, s1, s2)
    __s1 = convert(NVector, s1)
    __s2 = convert(NVector, s2)
    SUNLinSolSetScalingVectors_SPBCGS(S, convert(N_Vector, __s1), convert(N_Vector, __s2))
end

function SUNLinSolSetup_SPBCGS(S::SUNLinearSolver, A::SUNMatrix)
    ccall((:SUNLinSolSetup_SPBCGS, libsundials_sunlinsolspbcgs), Cint, (SUNLinearSolver, SUNMatrix), S, A)
end

function SUNLinSolSolve_SPBCGS(S::SUNLinearSolver, A::SUNMatrix, x::N_Vector, b::N_Vector, tol::realtype)
    ccall((:SUNLinSolSolve_SPBCGS, libsundials_sunlinsolspbcgs), Cint, (SUNLinearSolver, SUNMatrix, N_Vector, N_Vector, realtype), S, A, x, b, tol)
end

function SUNLinSolSolve_SPBCGS(S, A, x, b, tol)
    __x = convert(NVector, x)
    __b = convert(NVector, b)
    SUNLinSolSolve_SPBCGS(S, A, convert(N_Vector, __x), convert(N_Vector, __b), tol)
end

function SUNLinSolNumIters_SPBCGS(S::SUNLinearSolver)
    ccall((:SUNLinSolNumIters_SPBCGS, libsundials_sunlinsolspbcgs), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolResNorm_SPBCGS(S::SUNLinearSolver)
    ccall((:SUNLinSolResNorm_SPBCGS, libsundials_sunlinsolspbcgs), realtype, (SUNLinearSolver,), S)
end

function SUNLinSolResid_SPBCGS(S::SUNLinearSolver)
    ccall((:SUNLinSolResid_SPBCGS, libsundials_sunlinsolspbcgs), N_Vector, (SUNLinearSolver,), S)
end

function SUNLinSolLastFlag_SPBCGS(S::SUNLinearSolver)
    ccall((:SUNLinSolLastFlag_SPBCGS, libsundials_sunlinsolspbcgs), sunindextype, (SUNLinearSolver,), S)
end

function SUNLinSolSpace_SPBCGS(S::SUNLinearSolver, lenrwLS, leniwLS)
    ccall((:SUNLinSolSpace_SPBCGS, libsundials_sunlinsolspbcgs), Cint, (SUNLinearSolver, Ptr{Clong}, Ptr{Clong}), S, lenrwLS, leniwLS)
end

function SUNLinSolFree_SPBCGS(S::SUNLinearSolver)
    ccall((:SUNLinSolFree_SPBCGS, libsundials_sunlinsolspbcgs), Cint, (SUNLinearSolver,), S)
end

function SUNLinSol_SPFGMR(y::N_Vector, pretype::Cint, maxl::Cint)
    ccall((:SUNLinSol_SPFGMR, libsundials_sunlinsolspfgmr), SUNLinearSolver, (N_Vector, Cint, Cint), y, pretype, maxl)
end

function SUNLinSol_SPFGMR(y, pretype, maxl)
    __y = convert(NVector, y)
    SUNLinSol_SPFGMR(convert(N_Vector, __y), convert(Cint, pretype), convert(Cint, maxl))
end

function SUNLinSol_SPFGMRSetPrecType(S::SUNLinearSolver, pretype::Cint)
    ccall((:SUNLinSol_SPFGMRSetPrecType, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver, Cint), S, pretype)
end

function SUNLinSol_SPFGMRSetPrecType(S, pretype)
    SUNLinSol_SPFGMRSetPrecType(S, convert(Cint, pretype))
end

function SUNLinSol_SPFGMRSetGSType(S::SUNLinearSolver, gstype::Cint)
    ccall((:SUNLinSol_SPFGMRSetGSType, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver, Cint), S, gstype)
end

function SUNLinSol_SPFGMRSetGSType(S, gstype)
    SUNLinSol_SPFGMRSetGSType(S, convert(Cint, gstype))
end

function SUNLinSol_SPFGMRSetMaxRestarts(S::SUNLinearSolver, maxrs::Cint)
    ccall((:SUNLinSol_SPFGMRSetMaxRestarts, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver, Cint), S, maxrs)
end

function SUNLinSol_SPFGMRSetMaxRestarts(S, maxrs)
    SUNLinSol_SPFGMRSetMaxRestarts(S, convert(Cint, maxrs))
end

function SUNSPFGMR(y::N_Vector, pretype::Cint, maxl::Cint)
    ccall((:SUNSPFGMR, libsundials_sunlinsolspfgmr), SUNLinearSolver, (N_Vector, Cint, Cint), y, pretype, maxl)
end

function SUNSPFGMR(y, pretype, maxl)
    __y = convert(NVector, y)
    SUNSPFGMR(convert(N_Vector, __y), convert(Cint, pretype), convert(Cint, maxl))
end

function SUNSPFGMRSetPrecType(S::SUNLinearSolver, pretype::Cint)
    ccall((:SUNSPFGMRSetPrecType, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver, Cint), S, pretype)
end

function SUNSPFGMRSetPrecType(S, pretype)
    SUNSPFGMRSetPrecType(S, convert(Cint, pretype))
end

function SUNSPFGMRSetGSType(S::SUNLinearSolver, gstype::Cint)
    ccall((:SUNSPFGMRSetGSType, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver, Cint), S, gstype)
end

function SUNSPFGMRSetGSType(S, gstype)
    SUNSPFGMRSetGSType(S, convert(Cint, gstype))
end

function SUNSPFGMRSetMaxRestarts(S::SUNLinearSolver, maxrs::Cint)
    ccall((:SUNSPFGMRSetMaxRestarts, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver, Cint), S, maxrs)
end

function SUNSPFGMRSetMaxRestarts(S, maxrs)
    SUNSPFGMRSetMaxRestarts(S, convert(Cint, maxrs))
end

function SUNLinSolGetType_SPFGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolGetType_SPFGMR, libsundials_sunlinsolspfgmr), SUNLinearSolver_Type, (SUNLinearSolver,), S)
end

function SUNLinSolGetID_SPFGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolGetID_SPFGMR, libsundials_sunlinsolspfgmr), SUNLinearSolver_ID, (SUNLinearSolver,), S)
end

function SUNLinSolInitialize_SPFGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolInitialize_SPFGMR, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolSetATimes_SPFGMR(S::SUNLinearSolver, A_data, ATimes::ATimesFn)
    ccall((:SUNLinSolSetATimes_SPFGMR, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver, Ptr{Cvoid}, ATimesFn), S, A_data, ATimes)
end

function SUNLinSolSetPreconditioner_SPFGMR(S::SUNLinearSolver, P_data, Pset::PSetupFn, Psol::PSolveFn)
    ccall((:SUNLinSolSetPreconditioner_SPFGMR, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver, Ptr{Cvoid}, PSetupFn, PSolveFn), S, P_data, Pset, Psol)
end

function SUNLinSolSetScalingVectors_SPFGMR(S::SUNLinearSolver, s1::N_Vector, s2::N_Vector)
    ccall((:SUNLinSolSetScalingVectors_SPFGMR, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver, N_Vector, N_Vector), S, s1, s2)
end

function SUNLinSolSetScalingVectors_SPFGMR(S, s1, s2)
    __s1 = convert(NVector, s1)
    __s2 = convert(NVector, s2)
    SUNLinSolSetScalingVectors_SPFGMR(S, convert(N_Vector, __s1), convert(N_Vector, __s2))
end

function SUNLinSolSetup_SPFGMR(S::SUNLinearSolver, A::SUNMatrix)
    ccall((:SUNLinSolSetup_SPFGMR, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver, SUNMatrix), S, A)
end

function SUNLinSolSolve_SPFGMR(S::SUNLinearSolver, A::SUNMatrix, x::N_Vector, b::N_Vector, tol::realtype)
    ccall((:SUNLinSolSolve_SPFGMR, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver, SUNMatrix, N_Vector, N_Vector, realtype), S, A, x, b, tol)
end

function SUNLinSolSolve_SPFGMR(S, A, x, b, tol)
    __x = convert(NVector, x)
    __b = convert(NVector, b)
    SUNLinSolSolve_SPFGMR(S, A, convert(N_Vector, __x), convert(N_Vector, __b), tol)
end

function SUNLinSolNumIters_SPFGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolNumIters_SPFGMR, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolResNorm_SPFGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolResNorm_SPFGMR, libsundials_sunlinsolspfgmr), realtype, (SUNLinearSolver,), S)
end

function SUNLinSolResid_SPFGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolResid_SPFGMR, libsundials_sunlinsolspfgmr), N_Vector, (SUNLinearSolver,), S)
end

function SUNLinSolLastFlag_SPFGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolLastFlag_SPFGMR, libsundials_sunlinsolspfgmr), sunindextype, (SUNLinearSolver,), S)
end

function SUNLinSolSpace_SPFGMR(S::SUNLinearSolver, lenrwLS, leniwLS)
    ccall((:SUNLinSolSpace_SPFGMR, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver, Ptr{Clong}, Ptr{Clong}), S, lenrwLS, leniwLS)
end

function SUNLinSolFree_SPFGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolFree_SPFGMR, libsundials_sunlinsolspfgmr), Cint, (SUNLinearSolver,), S)
end

function SUNLinSol_SPGMR(y::N_Vector, pretype::Cint, maxl::Cint)
    ccall((:SUNLinSol_SPGMR, libsundials_sunlinsolspgmr), SUNLinearSolver, (N_Vector, Cint, Cint), y, pretype, maxl)
end

function SUNLinSol_SPGMR(y, pretype, maxl)
    __y = convert(NVector, y)
    SUNLinSol_SPGMR(convert(N_Vector, __y), convert(Cint, pretype), convert(Cint, maxl))
end

function SUNLinSol_SPGMRSetPrecType(S::SUNLinearSolver, pretype::Cint)
    ccall((:SUNLinSol_SPGMRSetPrecType, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver, Cint), S, pretype)
end

function SUNLinSol_SPGMRSetPrecType(S, pretype)
    SUNLinSol_SPGMRSetPrecType(S, convert(Cint, pretype))
end

function SUNLinSol_SPGMRSetGSType(S::SUNLinearSolver, gstype::Cint)
    ccall((:SUNLinSol_SPGMRSetGSType, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver, Cint), S, gstype)
end

function SUNLinSol_SPGMRSetGSType(S, gstype)
    SUNLinSol_SPGMRSetGSType(S, convert(Cint, gstype))
end

function SUNLinSol_SPGMRSetMaxRestarts(S::SUNLinearSolver, maxrs::Cint)
    ccall((:SUNLinSol_SPGMRSetMaxRestarts, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver, Cint), S, maxrs)
end

function SUNLinSol_SPGMRSetMaxRestarts(S, maxrs)
    SUNLinSol_SPGMRSetMaxRestarts(S, convert(Cint, maxrs))
end

function SUNSPGMR(y::N_Vector, pretype::Cint, maxl::Cint)
    ccall((:SUNSPGMR, libsundials_sunlinsolspgmr), SUNLinearSolver, (N_Vector, Cint, Cint), y, pretype, maxl)
end

function SUNSPGMR(y, pretype, maxl)
    __y = convert(NVector, y)
    SUNSPGMR(convert(N_Vector, __y), convert(Cint, pretype), convert(Cint, maxl))
end

function SUNSPGMRSetPrecType(S::SUNLinearSolver, pretype::Cint)
    ccall((:SUNSPGMRSetPrecType, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver, Cint), S, pretype)
end

function SUNSPGMRSetPrecType(S, pretype)
    SUNSPGMRSetPrecType(S, convert(Cint, pretype))
end

function SUNSPGMRSetGSType(S::SUNLinearSolver, gstype::Cint)
    ccall((:SUNSPGMRSetGSType, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver, Cint), S, gstype)
end

function SUNSPGMRSetGSType(S, gstype)
    SUNSPGMRSetGSType(S, convert(Cint, gstype))
end

function SUNSPGMRSetMaxRestarts(S::SUNLinearSolver, maxrs::Cint)
    ccall((:SUNSPGMRSetMaxRestarts, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver, Cint), S, maxrs)
end

function SUNSPGMRSetMaxRestarts(S, maxrs)
    SUNSPGMRSetMaxRestarts(S, convert(Cint, maxrs))
end

function SUNLinSolGetType_SPGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolGetType_SPGMR, libsundials_sunlinsolspgmr), SUNLinearSolver_Type, (SUNLinearSolver,), S)
end

function SUNLinSolGetID_SPGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolGetID_SPGMR, libsundials_sunlinsolspgmr), SUNLinearSolver_ID, (SUNLinearSolver,), S)
end

function SUNLinSolInitialize_SPGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolInitialize_SPGMR, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolSetATimes_SPGMR(S::SUNLinearSolver, A_data, ATimes::ATimesFn)
    ccall((:SUNLinSolSetATimes_SPGMR, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver, Ptr{Cvoid}, ATimesFn), S, A_data, ATimes)
end

function SUNLinSolSetPreconditioner_SPGMR(S::SUNLinearSolver, P_data, Pset::PSetupFn, Psol::PSolveFn)
    ccall((:SUNLinSolSetPreconditioner_SPGMR, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver, Ptr{Cvoid}, PSetupFn, PSolveFn), S, P_data, Pset, Psol)
end

function SUNLinSolSetScalingVectors_SPGMR(S::SUNLinearSolver, s1::N_Vector, s2::N_Vector)
    ccall((:SUNLinSolSetScalingVectors_SPGMR, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver, N_Vector, N_Vector), S, s1, s2)
end

function SUNLinSolSetScalingVectors_SPGMR(S, s1, s2)
    __s1 = convert(NVector, s1)
    __s2 = convert(NVector, s2)
    SUNLinSolSetScalingVectors_SPGMR(S, convert(N_Vector, __s1), convert(N_Vector, __s2))
end

function SUNLinSolSetup_SPGMR(S::SUNLinearSolver, A::SUNMatrix)
    ccall((:SUNLinSolSetup_SPGMR, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver, SUNMatrix), S, A)
end

function SUNLinSolSolve_SPGMR(S::SUNLinearSolver, A::SUNMatrix, x::N_Vector, b::N_Vector, tol::realtype)
    ccall((:SUNLinSolSolve_SPGMR, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver, SUNMatrix, N_Vector, N_Vector, realtype), S, A, x, b, tol)
end

function SUNLinSolSolve_SPGMR(S, A, x, b, tol)
    __x = convert(NVector, x)
    __b = convert(NVector, b)
    SUNLinSolSolve_SPGMR(S, A, convert(N_Vector, __x), convert(N_Vector, __b), tol)
end

function SUNLinSolNumIters_SPGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolNumIters_SPGMR, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolResNorm_SPGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolResNorm_SPGMR, libsundials_sunlinsolspgmr), realtype, (SUNLinearSolver,), S)
end

function SUNLinSolResid_SPGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolResid_SPGMR, libsundials_sunlinsolspgmr), N_Vector, (SUNLinearSolver,), S)
end

function SUNLinSolLastFlag_SPGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolLastFlag_SPGMR, libsundials_sunlinsolspgmr), sunindextype, (SUNLinearSolver,), S)
end

function SUNLinSolSpace_SPGMR(S::SUNLinearSolver, lenrwLS, leniwLS)
    ccall((:SUNLinSolSpace_SPGMR, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver, Ptr{Clong}, Ptr{Clong}), S, lenrwLS, leniwLS)
end

function SUNLinSolFree_SPGMR(S::SUNLinearSolver)
    ccall((:SUNLinSolFree_SPGMR, libsundials_sunlinsolspgmr), Cint, (SUNLinearSolver,), S)
end

function SUNLinSol_SPTFQMR(y::N_Vector, pretype::Cint, maxl::Cint)
    ccall((:SUNLinSol_SPTFQMR, libsundials_sunlinsolsptfqmr), SUNLinearSolver, (N_Vector, Cint, Cint), y, pretype, maxl)
end

function SUNLinSol_SPTFQMR(y, pretype, maxl)
    __y = convert(NVector, y)
    SUNLinSol_SPTFQMR(convert(N_Vector, __y), convert(Cint, pretype), convert(Cint, maxl))
end

function SUNLinSol_SPTFQMRSetPrecType(S::SUNLinearSolver, pretype::Cint)
    ccall((:SUNLinSol_SPTFQMRSetPrecType, libsundials_sunlinsolsptfqmr), Cint, (SUNLinearSolver, Cint), S, pretype)
end

function SUNLinSol_SPTFQMRSetPrecType(S, pretype)
    SUNLinSol_SPTFQMRSetPrecType(S, convert(Cint, pretype))
end

function SUNLinSol_SPTFQMRSetMaxl(S::SUNLinearSolver, maxl::Cint)
    ccall((:SUNLinSol_SPTFQMRSetMaxl, libsundials_sunlinsolsptfqmr), Cint, (SUNLinearSolver, Cint), S, maxl)
end

function SUNLinSol_SPTFQMRSetMaxl(S, maxl)
    SUNLinSol_SPTFQMRSetMaxl(S, convert(Cint, maxl))
end

function SUNSPTFQMR(y::N_Vector, pretype::Cint, maxl::Cint)
    ccall((:SUNSPTFQMR, libsundials_sunlinsolsptfqmr), SUNLinearSolver, (N_Vector, Cint, Cint), y, pretype, maxl)
end

function SUNSPTFQMR(y, pretype, maxl)
    __y = convert(NVector, y)
    SUNSPTFQMR(convert(N_Vector, __y), convert(Cint, pretype), convert(Cint, maxl))
end

function SUNSPTFQMRSetPrecType(S::SUNLinearSolver, pretype::Cint)
    ccall((:SUNSPTFQMRSetPrecType, libsundials_sunlinsolsptfqmr), Cint, (SUNLinearSolver, Cint), S, pretype)
end

function SUNSPTFQMRSetPrecType(S, pretype)
    SUNSPTFQMRSetPrecType(S, convert(Cint, pretype))
end

function SUNSPTFQMRSetMaxl(S::SUNLinearSolver, maxl::Cint)
    ccall((:SUNSPTFQMRSetMaxl, libsundials_sunlinsolsptfqmr), Cint, (SUNLinearSolver, Cint), S, maxl)
end

function SUNSPTFQMRSetMaxl(S, maxl)
    SUNSPTFQMRSetMaxl(S, convert(Cint, maxl))
end

function SUNLinSolGetType_SPTFQMR(S::SUNLinearSolver)
    ccall((:SUNLinSolGetType_SPTFQMR, libsundials_sunlinsolsptfqmr), SUNLinearSolver_Type, (SUNLinearSolver,), S)
end

function SUNLinSolGetID_SPTFQMR(S::SUNLinearSolver)
    ccall((:SUNLinSolGetID_SPTFQMR, libsundials_sunlinsolsptfqmr), SUNLinearSolver_ID, (SUNLinearSolver,), S)
end

function SUNLinSolInitialize_SPTFQMR(S::SUNLinearSolver)
    ccall((:SUNLinSolInitialize_SPTFQMR, libsundials_sunlinsolsptfqmr), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolSetATimes_SPTFQMR(S::SUNLinearSolver, A_data, ATimes::ATimesFn)
    ccall((:SUNLinSolSetATimes_SPTFQMR, libsundials_sunlinsolsptfqmr), Cint, (SUNLinearSolver, Ptr{Cvoid}, ATimesFn), S, A_data, ATimes)
end

function SUNLinSolSetPreconditioner_SPTFQMR(S::SUNLinearSolver, P_data, Pset::PSetupFn, Psol::PSolveFn)
    ccall((:SUNLinSolSetPreconditioner_SPTFQMR, libsundials_sunlinsolsptfqmr), Cint, (SUNLinearSolver, Ptr{Cvoid}, PSetupFn, PSolveFn), S, P_data, Pset, Psol)
end

function SUNLinSolSetScalingVectors_SPTFQMR(S::SUNLinearSolver, s1::N_Vector, s2::N_Vector)
    ccall((:SUNLinSolSetScalingVectors_SPTFQMR, libsundials_sunlinsolsptfqmr), Cint, (SUNLinearSolver, N_Vector, N_Vector), S, s1, s2)
end

function SUNLinSolSetScalingVectors_SPTFQMR(S, s1, s2)
    __s1 = convert(NVector, s1)
    __s2 = convert(NVector, s2)
    SUNLinSolSetScalingVectors_SPTFQMR(S, convert(N_Vector, __s1), convert(N_Vector, __s2))
end

function SUNLinSolSetup_SPTFQMR(S::SUNLinearSolver, A::SUNMatrix)
    ccall((:SUNLinSolSetup_SPTFQMR, libsundials_sunlinsolsptfqmr), Cint, (SUNLinearSolver, SUNMatrix), S, A)
end

function SUNLinSolSolve_SPTFQMR(S::SUNLinearSolver, A::SUNMatrix, x::N_Vector, b::N_Vector, tol::realtype)
    ccall((:SUNLinSolSolve_SPTFQMR, libsundials_sunlinsolsptfqmr), Cint, (SUNLinearSolver, SUNMatrix, N_Vector, N_Vector, realtype), S, A, x, b, tol)
end

function SUNLinSolSolve_SPTFQMR(S, A, x, b, tol)
    __x = convert(NVector, x)
    __b = convert(NVector, b)
    SUNLinSolSolve_SPTFQMR(S, A, convert(N_Vector, __x), convert(N_Vector, __b), tol)
end

function SUNLinSolNumIters_SPTFQMR(S::SUNLinearSolver)
    ccall((:SUNLinSolNumIters_SPTFQMR, libsundials_sunlinsolsptfqmr), Cint, (SUNLinearSolver,), S)
end

function SUNLinSolResNorm_SPTFQMR(S::SUNLinearSolver)
    ccall((:SUNLinSolResNorm_SPTFQMR, libsundials_sunlinsolsptfqmr), realtype, (SUNLinearSolver,), S)
end

function SUNLinSolResid_SPTFQMR(S::SUNLinearSolver)
    ccall((:SUNLinSolResid_SPTFQMR, libsundials_sunlinsolsptfqmr), N_Vector, (SUNLinearSolver,), S)
end

function SUNLinSolLastFlag_SPTFQMR(S::SUNLinearSolver)
    ccall((:SUNLinSolLastFlag_SPTFQMR, libsundials_sunlinsolsptfqmr), sunindextype, (SUNLinearSolver,), S)
end

function SUNLinSolSpace_SPTFQMR(S::SUNLinearSolver, lenrwLS, leniwLS)
    ccall((:SUNLinSolSpace_SPTFQMR, libsundials_sunlinsolsptfqmr), Cint, (SUNLinearSolver, Ptr{Clong}, Ptr{Clong}), S, lenrwLS, leniwLS)
end

function SUNLinSolFree_SPTFQMR(S::SUNLinearSolver)
    ccall((:SUNLinSolFree_SPTFQMR, libsundials_sunlinsolsptfqmr), Cint, (SUNLinearSolver,), S)
end

function SUNBandMatrix(N::sunindextype, mu::sunindextype, ml::sunindextype)
    ccall((:SUNBandMatrix, libsundials_sunmatrixband), SUNMatrix, (sunindextype, sunindextype, sunindextype), N, mu, ml)
end

function SUNBandMatrixStorage(N::sunindextype, mu::sunindextype, ml::sunindextype, smu::sunindextype)
    ccall((:SUNBandMatrixStorage, libsundials_sunmatrixband), SUNMatrix, (sunindextype, sunindextype, sunindextype, sunindextype), N, mu, ml, smu)
end

function SUNBandMatrix_Print(A::SUNMatrix, outfile)
    ccall((:SUNBandMatrix_Print, libsundials_sunmatrixband), Cvoid, (SUNMatrix, Ptr{Libc.FILE}), A, outfile)
end

function SUNBandMatrix_Rows(A::SUNMatrix)
    ccall((:SUNBandMatrix_Rows, libsundials_sunmatrixband), sunindextype, (SUNMatrix,), A)
end

function SUNBandMatrix_Columns(A::SUNMatrix)
    ccall((:SUNBandMatrix_Columns, libsundials_sunmatrixband), sunindextype, (SUNMatrix,), A)
end

function SUNBandMatrix_LowerBandwidth(A::SUNMatrix)
    ccall((:SUNBandMatrix_LowerBandwidth, libsundials_sunmatrixband), sunindextype, (SUNMatrix,), A)
end

function SUNBandMatrix_UpperBandwidth(A::SUNMatrix)
    ccall((:SUNBandMatrix_UpperBandwidth, libsundials_sunmatrixband), sunindextype, (SUNMatrix,), A)
end

function SUNBandMatrix_StoredUpperBandwidth(A::SUNMatrix)
    ccall((:SUNBandMatrix_StoredUpperBandwidth, libsundials_sunmatrixband), sunindextype, (SUNMatrix,), A)
end

function SUNBandMatrix_LDim(A::SUNMatrix)
    ccall((:SUNBandMatrix_LDim, libsundials_sunmatrixband), sunindextype, (SUNMatrix,), A)
end

function SUNBandMatrix_Data(A::SUNMatrix)
    ccall((:SUNBandMatrix_Data, libsundials_sunmatrixband), Ptr{realtype}, (SUNMatrix,), A)
end

function SUNBandMatrix_Cols(A::SUNMatrix)
    ccall((:SUNBandMatrix_Cols, libsundials_sunmatrixband), Ptr{Ptr{realtype}}, (SUNMatrix,), A)
end

function SUNBandMatrix_Column(A::SUNMatrix, j::sunindextype)
    ccall((:SUNBandMatrix_Column, libsundials_sunmatrixband), Ptr{realtype}, (SUNMatrix, sunindextype), A, j)
end

function SUNMatGetID_Band(A::SUNMatrix)
    ccall((:SUNMatGetID_Band, libsundials_sunmatrixband), SUNMatrix_ID, (SUNMatrix,), A)
end

function SUNMatClone_Band(A::SUNMatrix)
    ccall((:SUNMatClone_Band, libsundials_sunmatrixband), SUNMatrix, (SUNMatrix,), A)
end

function SUNMatDestroy_Band(A::SUNMatrix)
    ccall((:SUNMatDestroy_Band, libsundials_sunmatrixband), Cvoid, (SUNMatrix,), A)
end

function SUNMatZero_Band(A::SUNMatrix)
    ccall((:SUNMatZero_Band, libsundials_sunmatrixband), Cint, (SUNMatrix,), A)
end

function SUNMatCopy_Band(A::SUNMatrix, B::SUNMatrix)
    ccall((:SUNMatCopy_Band, libsundials_sunmatrixband), Cint, (SUNMatrix, SUNMatrix), A, B)
end

function SUNMatScaleAdd_Band(c::realtype, A::SUNMatrix, B::SUNMatrix)
    ccall((:SUNMatScaleAdd_Band, libsundials_sunmatrixband), Cint, (realtype, SUNMatrix, SUNMatrix), c, A, B)
end

function SUNMatScaleAddI_Band(c::realtype, A::SUNMatrix)
    ccall((:SUNMatScaleAddI_Band, libsundials_sunmatrixband), Cint, (realtype, SUNMatrix), c, A)
end

function SUNMatMatvec_Band(A::SUNMatrix, x::N_Vector, y::N_Vector)
    ccall((:SUNMatMatvec_Band, libsundials_sunmatrixband), Cint, (SUNMatrix, N_Vector, N_Vector), A, x, y)
end

function SUNMatMatvec_Band(A, x, y)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    SUNMatMatvec_Band(A, convert(N_Vector, __x), convert(N_Vector, __y))
end

function SUNMatSpace_Band(A::SUNMatrix, lenrw, leniw)
    ccall((:SUNMatSpace_Band, libsundials_sunmatrixband), Cint, (SUNMatrix, Ptr{Clong}, Ptr{Clong}), A, lenrw, leniw)
end

function SUNDenseMatrix(M::sunindextype, N::sunindextype)
    ccall((:SUNDenseMatrix, libsundials_sunmatrixdense), SUNMatrix, (sunindextype, sunindextype), M, N)
end

function SUNDenseMatrix_Print(A::SUNMatrix, outfile)
    ccall((:SUNDenseMatrix_Print, libsundials_sunmatrixdense), Cvoid, (SUNMatrix, Ptr{Libc.FILE}), A, outfile)
end

function SUNDenseMatrix_Rows(A::SUNMatrix)
    ccall((:SUNDenseMatrix_Rows, libsundials_sunmatrixdense), sunindextype, (SUNMatrix,), A)
end

function SUNDenseMatrix_Columns(A::SUNMatrix)
    ccall((:SUNDenseMatrix_Columns, libsundials_sunmatrixdense), sunindextype, (SUNMatrix,), A)
end

function SUNDenseMatrix_LData(A::SUNMatrix)
    ccall((:SUNDenseMatrix_LData, libsundials_sunmatrixdense), sunindextype, (SUNMatrix,), A)
end

function SUNDenseMatrix_Data(A::SUNMatrix)
    ccall((:SUNDenseMatrix_Data, libsundials_sunmatrixdense), Ptr{realtype}, (SUNMatrix,), A)
end

function SUNDenseMatrix_Cols(A::SUNMatrix)
    ccall((:SUNDenseMatrix_Cols, libsundials_sunmatrixdense), Ptr{Ptr{realtype}}, (SUNMatrix,), A)
end

function SUNDenseMatrix_Column(A::SUNMatrix, j::sunindextype)
    ccall((:SUNDenseMatrix_Column, libsundials_sunmatrixdense), Ptr{realtype}, (SUNMatrix, sunindextype), A, j)
end

function SUNMatGetID_Dense(A::SUNMatrix)
    ccall((:SUNMatGetID_Dense, libsundials_sunmatrixdense), SUNMatrix_ID, (SUNMatrix,), A)
end

function SUNMatClone_Dense(A::SUNMatrix)
    ccall((:SUNMatClone_Dense, libsundials_sunmatrixdense), SUNMatrix, (SUNMatrix,), A)
end

function SUNMatDestroy_Dense(A::SUNMatrix)
    ccall((:SUNMatDestroy_Dense, libsundials_sunmatrixdense), Cvoid, (SUNMatrix,), A)
end

function SUNMatZero_Dense(A::SUNMatrix)
    ccall((:SUNMatZero_Dense, libsundials_sunmatrixdense), Cint, (SUNMatrix,), A)
end

function SUNMatCopy_Dense(A::SUNMatrix, B::SUNMatrix)
    ccall((:SUNMatCopy_Dense, libsundials_sunmatrixdense), Cint, (SUNMatrix, SUNMatrix), A, B)
end

function SUNMatScaleAdd_Dense(c::realtype, A::SUNMatrix, B::SUNMatrix)
    ccall((:SUNMatScaleAdd_Dense, libsundials_sunmatrixdense), Cint, (realtype, SUNMatrix, SUNMatrix), c, A, B)
end

function SUNMatScaleAddI_Dense(c::realtype, A::SUNMatrix)
    ccall((:SUNMatScaleAddI_Dense, libsundials_sunmatrixdense), Cint, (realtype, SUNMatrix), c, A)
end

function SUNMatMatvec_Dense(A::SUNMatrix, x::N_Vector, y::N_Vector)
    ccall((:SUNMatMatvec_Dense, libsundials_sunmatrixdense), Cint, (SUNMatrix, N_Vector, N_Vector), A, x, y)
end

function SUNMatMatvec_Dense(A, x, y)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    SUNMatMatvec_Dense(A, convert(N_Vector, __x), convert(N_Vector, __y))
end

function SUNMatSpace_Dense(A::SUNMatrix, lenrw, leniw)
    ccall((:SUNMatSpace_Dense, libsundials_sunmatrixdense), Cint, (SUNMatrix, Ptr{Clong}, Ptr{Clong}), A, lenrw, leniw)
end

function SUNSparseMatrix(M::sunindextype, N::sunindextype, NNZ::sunindextype, sparsetype::Cint)
    ccall((:SUNSparseMatrix, libsundials_sunmatrixsparse), SUNMatrix, (sunindextype, sunindextype, sunindextype, Cint), M, N, NNZ, sparsetype)
end

function SUNSparseMatrix(M, N, NNZ, sparsetype)
    SUNSparseMatrix(M, N, NNZ, convert(Cint, sparsetype))
end

function SUNSparseFromDenseMatrix(A::SUNMatrix, droptol::realtype, sparsetype::Cint)
    ccall((:SUNSparseFromDenseMatrix, libsundials_sunmatrixdense), SUNMatrix, (SUNMatrix, realtype, Cint), A, droptol, sparsetype)
end

function SUNSparseFromDenseMatrix(A, droptol, sparsetype)
    SUNSparseFromDenseMatrix(A, droptol, convert(Cint, sparsetype))
end

function SUNSparseFromBandMatrix(A::SUNMatrix, droptol::realtype, sparsetype::Cint)
    ccall((:SUNSparseFromBandMatrix, libsundials_sunmatrixband), SUNMatrix, (SUNMatrix, realtype, Cint), A, droptol, sparsetype)
end

function SUNSparseFromBandMatrix(A, droptol, sparsetype)
    SUNSparseFromBandMatrix(A, droptol, convert(Cint, sparsetype))
end

function SUNSparseMatrix_ToCSR(A::SUNMatrix, Bout)
    ccall((:SUNSparseMatrix_ToCSR, libsundials_sunmatrixsparse), Cint, (SUNMatrix, Ptr{SUNMatrix}), A, Bout)
end

function SUNSparseMatrix_ToCSC(A::SUNMatrix, Bout)
    ccall((:SUNSparseMatrix_ToCSC, libsundials_sunmatrixsparse), Cint, (SUNMatrix, Ptr{SUNMatrix}), A, Bout)
end

function SUNSparseMatrix_Realloc(A::SUNMatrix)
    ccall((:SUNSparseMatrix_Realloc, libsundials_sunmatrixsparse), Cint, (SUNMatrix,), A)
end

function SUNSparseMatrix_Reallocate(A::SUNMatrix, NNZ::sunindextype)
    ccall((:SUNSparseMatrix_Reallocate, libsundials_sunmatrixsparse), Cint, (SUNMatrix, sunindextype), A, NNZ)
end

function SUNSparseMatrix_Print(A::SUNMatrix, outfile)
    ccall((:SUNSparseMatrix_Print, libsundials_sunmatrixsparse), Cvoid, (SUNMatrix, Ptr{Libc.FILE}), A, outfile)
end

function SUNSparseMatrix_Rows(A::SUNMatrix)
    ccall((:SUNSparseMatrix_Rows, libsundials_sunmatrixsparse), sunindextype, (SUNMatrix,), A)
end

function SUNSparseMatrix_Columns(A::SUNMatrix)
    ccall((:SUNSparseMatrix_Columns, libsundials_sunmatrixsparse), sunindextype, (SUNMatrix,), A)
end

function SUNSparseMatrix_NNZ(A::SUNMatrix)
    ccall((:SUNSparseMatrix_NNZ, libsundials_sunmatrixsparse), sunindextype, (SUNMatrix,), A)
end

function SUNSparseMatrix_NP(A::SUNMatrix)
    ccall((:SUNSparseMatrix_NP, libsundials_sunmatrixsparse), sunindextype, (SUNMatrix,), A)
end

function SUNSparseMatrix_SparseType(A::SUNMatrix)
    ccall((:SUNSparseMatrix_SparseType, libsundials_sunmatrixsparse), Cint, (SUNMatrix,), A)
end

function SUNSparseMatrix_Data(A::SUNMatrix)
    ccall((:SUNSparseMatrix_Data, libsundials_sunmatrixsparse), Ptr{realtype}, (SUNMatrix,), A)
end

function SUNSparseMatrix_IndexValues(A::SUNMatrix)
    ccall((:SUNSparseMatrix_IndexValues, libsundials_sunmatrixsparse), Ptr{sunindextype}, (SUNMatrix,), A)
end

function SUNSparseMatrix_IndexPointers(A::SUNMatrix)
    ccall((:SUNSparseMatrix_IndexPointers, libsundials_sunmatrixsparse), Ptr{sunindextype}, (SUNMatrix,), A)
end

function SUNMatGetID_Sparse(A::SUNMatrix)
    ccall((:SUNMatGetID_Sparse, libsundials_sunmatrixsparse), SUNMatrix_ID, (SUNMatrix,), A)
end

function SUNMatClone_Sparse(A::SUNMatrix)
    ccall((:SUNMatClone_Sparse, libsundials_sunmatrixsparse), SUNMatrix, (SUNMatrix,), A)
end

function SUNMatDestroy_Sparse(A::SUNMatrix)
    ccall((:SUNMatDestroy_Sparse, libsundials_sunmatrixsparse), Cvoid, (SUNMatrix,), A)
end

function SUNMatZero_Sparse(A::SUNMatrix)
    ccall((:SUNMatZero_Sparse, libsundials_sunmatrixsparse), Cint, (SUNMatrix,), A)
end

function SUNMatCopy_Sparse(A::SUNMatrix, B::SUNMatrix)
    ccall((:SUNMatCopy_Sparse, libsundials_sunmatrixsparse), Cint, (SUNMatrix, SUNMatrix), A, B)
end

function SUNMatScaleAdd_Sparse(c::realtype, A::SUNMatrix, B::SUNMatrix)
    ccall((:SUNMatScaleAdd_Sparse, libsundials_sunmatrixsparse), Cint, (realtype, SUNMatrix, SUNMatrix), c, A, B)
end

function SUNMatScaleAddI_Sparse(c::realtype, A::SUNMatrix)
    ccall((:SUNMatScaleAddI_Sparse, libsundials_sunmatrixsparse), Cint, (realtype, SUNMatrix), c, A)
end

function SUNMatMatvec_Sparse(A::SUNMatrix, x::N_Vector, y::N_Vector)
    ccall((:SUNMatMatvec_Sparse, libsundials_sunmatrixsparse), Cint, (SUNMatrix, N_Vector, N_Vector), A, x, y)
end

function SUNMatMatvec_Sparse(A, x, y)
    __x = convert(NVector, x)
    __y = convert(NVector, y)
    SUNMatMatvec_Sparse(A, convert(N_Vector, __x), convert(N_Vector, __y))
end

function SUNMatSpace_Sparse(A::SUNMatrix, lenrw, leniw)
    ccall((:SUNMatSpace_Sparse, libsundials_sunmatrixsparse), Cint, (SUNMatrix, Ptr{Clong}, Ptr{Clong}), A, lenrw, leniw)
end

function SUNNonlinSol_FixedPoint(y::N_Vector, m::Cint)
    ccall((:SUNNonlinSol_FixedPoint, libsundials_sunnonlinsolfixedpoint), SUNNonlinearSolver, (N_Vector, Cint), y, m)
end

function SUNNonlinSol_FixedPoint(y, m)
    __y = convert(NVector, y)
    SUNNonlinSol_FixedPoint(convert(N_Vector, __y), convert(Cint, m))
end

function SUNNonlinSol_FixedPointSens(count::Cint, y::N_Vector, m::Cint)
    ccall((:SUNNonlinSol_FixedPointSens, libsundials_sunnonlinsolfixedpoint), SUNNonlinearSolver, (Cint, N_Vector, Cint), count, y, m)
end

function SUNNonlinSol_FixedPointSens(count, y, m)
    __y = convert(NVector, y)
    SUNNonlinSol_FixedPointSens(convert(Cint, count), convert(N_Vector, __y), convert(Cint, m))
end

function SUNNonlinSolGetType_FixedPoint(NLS::SUNNonlinearSolver)
    ccall((:SUNNonlinSolGetType_FixedPoint, libsundials_sunnonlinsolfixedpoint), SUNNonlinearSolver_Type, (SUNNonlinearSolver,), NLS)
end

function SUNNonlinSolInitialize_FixedPoint(NLS::SUNNonlinearSolver)
    ccall((:SUNNonlinSolInitialize_FixedPoint, libsundials_sunnonlinsolfixedpoint), Cint, (SUNNonlinearSolver,), NLS)
end

function SUNNonlinSolSolve_FixedPoint(NLS::SUNNonlinearSolver, y0::N_Vector, y::N_Vector, w::N_Vector, tol::realtype, callSetup::Cint, mem)
    ccall((:SUNNonlinSolSolve_FixedPoint, libsundials_sunnonlinsolfixedpoint), Cint, (SUNNonlinearSolver, N_Vector, N_Vector, N_Vector, realtype, Cint, Ptr{Cvoid}), NLS, y0, y, w, tol, callSetup, mem)
end

function SUNNonlinSolSolve_FixedPoint(NLS, y0, y, w, tol, callSetup, mem)
    __y0 = convert(NVector, y0)
    __y = convert(NVector, y)
    __w = convert(NVector, w)
    SUNNonlinSolSolve_FixedPoint(NLS, convert(N_Vector, __y0), convert(N_Vector, __y), convert(N_Vector, __w), tol, convert(Cint, callSetup), mem)
end

function SUNNonlinSolFree_FixedPoint(NLS::SUNNonlinearSolver)
    ccall((:SUNNonlinSolFree_FixedPoint, libsundials_sunnonlinsolfixedpoint), Cint, (SUNNonlinearSolver,), NLS)
end

function SUNNonlinSolSetSysFn_FixedPoint(NLS::SUNNonlinearSolver, SysFn::SUNNonlinSolSysFn)
    ccall((:SUNNonlinSolSetSysFn_FixedPoint, libsundials_sunnonlinsolfixedpoint), Cint, (SUNNonlinearSolver, SUNNonlinSolSysFn), NLS, SysFn)
end

function SUNNonlinSolSetConvTestFn_FixedPoint(NLS::SUNNonlinearSolver, CTestFn::SUNNonlinSolConvTestFn, ctest_data)
    ccall((:SUNNonlinSolSetConvTestFn_FixedPoint, libsundials_sunnonlinsolfixedpoint), Cint, (SUNNonlinearSolver, SUNNonlinSolConvTestFn, Ptr{Cvoid}), NLS, CTestFn, ctest_data)
end

function SUNNonlinSolSetMaxIters_FixedPoint(NLS::SUNNonlinearSolver, maxiters::Cint)
    ccall((:SUNNonlinSolSetMaxIters_FixedPoint, libsundials_sunnonlinsolfixedpoint), Cint, (SUNNonlinearSolver, Cint), NLS, maxiters)
end

function SUNNonlinSolSetMaxIters_FixedPoint(NLS, maxiters)
    SUNNonlinSolSetMaxIters_FixedPoint(NLS, convert(Cint, maxiters))
end

function SUNNonlinSolSetDamping_FixedPoint(NLS::SUNNonlinearSolver, beta::realtype)
    ccall((:SUNNonlinSolSetDamping_FixedPoint, libsundials_sunnonlinsolfixedpoint), Cint, (SUNNonlinearSolver, realtype), NLS, beta)
end

function SUNNonlinSolGetNumIters_FixedPoint(NLS::SUNNonlinearSolver, niters)
    ccall((:SUNNonlinSolGetNumIters_FixedPoint, libsundials_sunnonlinsolfixedpoint), Cint, (SUNNonlinearSolver, Ptr{Clong}), NLS, niters)
end

function SUNNonlinSolGetCurIter_FixedPoint(NLS::SUNNonlinearSolver, iter)
    ccall((:SUNNonlinSolGetCurIter_FixedPoint, libsundials_sunnonlinsolfixedpoint), Cint, (SUNNonlinearSolver, Ptr{Cint}), NLS, iter)
end

function SUNNonlinSolGetNumConvFails_FixedPoint(NLS::SUNNonlinearSolver, nconvfails)
    ccall((:SUNNonlinSolGetNumConvFails_FixedPoint, libsundials_sunnonlinsolfixedpoint), Cint, (SUNNonlinearSolver, Ptr{Clong}), NLS, nconvfails)
end

function SUNNonlinSolGetSysFn_FixedPoint(NLS::SUNNonlinearSolver, SysFn)
    ccall((:SUNNonlinSolGetSysFn_FixedPoint, libsundials_sunnonlinsolfixedpoint), Cint, (SUNNonlinearSolver, Ptr{SUNNonlinSolSysFn}), NLS, SysFn)
end

function SUNNonlinSol_Newton(y::N_Vector)
    ccall((:SUNNonlinSol_Newton, libsundials_sunnonlinsolnewton), SUNNonlinearSolver, (N_Vector,), y)
end

function SUNNonlinSol_Newton(y)
    __y = convert(NVector, y)
    SUNNonlinSol_Newton(convert(N_Vector, __y))
end

function SUNNonlinSol_NewtonSens(count::Cint, y::N_Vector)
    ccall((:SUNNonlinSol_NewtonSens, libsundials_sunnonlinsolnewton), SUNNonlinearSolver, (Cint, N_Vector), count, y)
end

function SUNNonlinSol_NewtonSens(count, y)
    __y = convert(NVector, y)
    SUNNonlinSol_NewtonSens(convert(Cint, count), convert(N_Vector, __y))
end

function SUNNonlinSolGetType_Newton(NLS::SUNNonlinearSolver)
    ccall((:SUNNonlinSolGetType_Newton, libsundials_sunnonlinsolnewton), SUNNonlinearSolver_Type, (SUNNonlinearSolver,), NLS)
end

function SUNNonlinSolInitialize_Newton(NLS::SUNNonlinearSolver)
    ccall((:SUNNonlinSolInitialize_Newton, libsundials_sunnonlinsolnewton), Cint, (SUNNonlinearSolver,), NLS)
end

function SUNNonlinSolSolve_Newton(NLS::SUNNonlinearSolver, y0::N_Vector, y::N_Vector, w::N_Vector, tol::realtype, callLSetup::Cint, mem)
    ccall((:SUNNonlinSolSolve_Newton, libsundials_sunnonlinsolnewton), Cint, (SUNNonlinearSolver, N_Vector, N_Vector, N_Vector, realtype, Cint, Ptr{Cvoid}), NLS, y0, y, w, tol, callLSetup, mem)
end

function SUNNonlinSolSolve_Newton(NLS, y0, y, w, tol, callLSetup, mem)
    __y0 = convert(NVector, y0)
    __y = convert(NVector, y)
    __w = convert(NVector, w)
    SUNNonlinSolSolve_Newton(NLS, convert(N_Vector, __y0), convert(N_Vector, __y), convert(N_Vector, __w), tol, convert(Cint, callLSetup), mem)
end

function SUNNonlinSolFree_Newton(NLS::SUNNonlinearSolver)
    ccall((:SUNNonlinSolFree_Newton, libsundials_sunnonlinsolnewton), Cint, (SUNNonlinearSolver,), NLS)
end

function SUNNonlinSolSetSysFn_Newton(NLS::SUNNonlinearSolver, SysFn::SUNNonlinSolSysFn)
    ccall((:SUNNonlinSolSetSysFn_Newton, libsundials_sunnonlinsolnewton), Cint, (SUNNonlinearSolver, SUNNonlinSolSysFn), NLS, SysFn)
end

function SUNNonlinSolSetLSetupFn_Newton(NLS::SUNNonlinearSolver, LSetupFn::SUNNonlinSolLSetupFn)
    ccall((:SUNNonlinSolSetLSetupFn_Newton, libsundials_sunnonlinsolnewton), Cint, (SUNNonlinearSolver, SUNNonlinSolLSetupFn), NLS, LSetupFn)
end

function SUNNonlinSolSetLSolveFn_Newton(NLS::SUNNonlinearSolver, LSolveFn::SUNNonlinSolLSolveFn)
    ccall((:SUNNonlinSolSetLSolveFn_Newton, libsundials_sunnonlinsolnewton), Cint, (SUNNonlinearSolver, SUNNonlinSolLSolveFn), NLS, LSolveFn)
end

function SUNNonlinSolSetConvTestFn_Newton(NLS::SUNNonlinearSolver, CTestFn::SUNNonlinSolConvTestFn, ctest_data)
    ccall((:SUNNonlinSolSetConvTestFn_Newton, libsundials_sunnonlinsolnewton), Cint, (SUNNonlinearSolver, SUNNonlinSolConvTestFn, Ptr{Cvoid}), NLS, CTestFn, ctest_data)
end

function SUNNonlinSolSetMaxIters_Newton(NLS::SUNNonlinearSolver, maxiters::Cint)
    ccall((:SUNNonlinSolSetMaxIters_Newton, libsundials_sunnonlinsolnewton), Cint, (SUNNonlinearSolver, Cint), NLS, maxiters)
end

function SUNNonlinSolSetMaxIters_Newton(NLS, maxiters)
    SUNNonlinSolSetMaxIters_Newton(NLS, convert(Cint, maxiters))
end

function SUNNonlinSolGetNumIters_Newton(NLS::SUNNonlinearSolver, niters)
    ccall((:SUNNonlinSolGetNumIters_Newton, libsundials_sunnonlinsolnewton), Cint, (SUNNonlinearSolver, Ptr{Clong}), NLS, niters)
end

function SUNNonlinSolGetCurIter_Newton(NLS::SUNNonlinearSolver, iter)
    ccall((:SUNNonlinSolGetCurIter_Newton, libsundials_sunnonlinsolnewton), Cint, (SUNNonlinearSolver, Ptr{Cint}), NLS, iter)
end

function SUNNonlinSolGetNumConvFails_Newton(NLS::SUNNonlinearSolver, nconvfails)
    ccall((:SUNNonlinSolGetNumConvFails_Newton, libsundials_sunnonlinsolnewton), Cint, (SUNNonlinearSolver, Ptr{Clong}), NLS, nconvfails)
end

function SUNNonlinSolGetSysFn_Newton(NLS::SUNNonlinearSolver, SysFn)
    ccall((:SUNNonlinSolGetSysFn_Newton, libsundials_sunnonlinsolnewton), Cint, (SUNNonlinearSolver, Ptr{SUNNonlinSolSysFn}), NLS, SysFn)
end

