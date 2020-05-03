create or replace function public.get_random_string(length int) 
    returns text 
    language plpgsql as
$$
declare
    chars text[] := '{A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}';
    result text := '';
    i int := 0;
begin
    if length < 0 
    then
        raise exception 'Length cannot be less than 0.';
    end if;

    for i in 1..length 
    loop
        result := concat(result, chars[1+random()*(array_length(chars, 1)-1)]);
    end loop;

    return result;
end;
$$;