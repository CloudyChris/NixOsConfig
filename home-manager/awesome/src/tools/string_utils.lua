function string:split(pat)
  pat = pat or '%s+'
  local st, g = 1, self:gmatch("()("..pat..")")
  local function getter(segs, seps, sep, cap1, ...)
    st = sep and seps + #sep
    return self:sub(segs, (seps or 0) - 1), cap1 or sep, ...
  end
  return function() if st then return getter(st, g()) end end
end

function string:trim()
   return (self:gsub("^%s*(.-)%s*$", "%1"))
end

function string:is_empty()
    if self:len() == 0 then
        return true
    end
end
