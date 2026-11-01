return {
    switch_workspace = function(next)
        local cws = hl.get_active_workspace()
        local wss = hl.get_workspaces()
        local firstws = wss[1]
        local lastws = wss[#wss]
        local cws_windows = cws.windows
        if next < 0 and cws.id == firstws.id then
            hl.dispatch(hl.dsp.focus({ workspace = lastws.id }))
        elseif 0 < next and cws_windows == 0 then
            hl.dispatch(hl.dsp.focus({ workspace = firstws.id }))
        else
            hl.dispatch(hl.dsp.focus({ workspace = cws.id + next }))
        end
    end,
}
